import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;

import 'firebase_storage.dart';

final firebaseStorageServiceProvider = Provider(
  (ref) => FirebaseStorageService(
    ref.read(firebaseStorageProvider),
  ),
);

/// A service class to upload, download, or delete files from Firebase Storage
class FirebaseStorageService {
  final FirebaseStorage _storage;

  const FirebaseStorageService(this._storage);

  ///
  /// throws an error, if [file] doesn't exist
  uploadFile({
    required String filename,
    required File file,
    required Function(Reference reference) onComplete,
    VoidCallback? onError,
    VoidCallback? onCancelled,
    Function(double progress)? onProgress,
  }) {
    final userDirectoryRef = _storage.ref(
      'events',
    );
    final directoryRef = userDirectoryRef;

    final fileRef = directoryRef.child('$filename${p.extension(file.path)}');
    final uploadTask = fileRef.putFile(file);

    // Listen for state changes, errors, and completion of the upload.
    uploadTask.snapshotEvents.listen(
      (TaskSnapshot taskSnapshot) {
        switch (taskSnapshot.state) {
          case TaskState.running:
            final progress = 100.0 *
                (taskSnapshot.bytesTransferred / taskSnapshot.totalBytes);
            debugPrint('Upload is $progress% complete.');
            onProgress?.call(progress);
            break;
          case TaskState.paused:
            debugPrint('Upload is paused.');
            break;
          case TaskState.canceled:
            debugPrint('Upload was canceled');
            onCancelled?.call();
            break;
          case TaskState.error:
            // Handle unsuccessful uploads
            debugPrint('There was an error in uploading');
            onError?.call();
            break;
          case TaskState.success:
            // Handle successful uploads on complete
            debugPrint('Uploaded successfully');
            onComplete(taskSnapshot.ref);
            break;
        }
      },
      onError: (_, __) => onError?.call(),
    );
  }

  /// deletes a file at [storageReference] from Firebase storage
  /// returns the status of the delete operation
  Future<bool> deleteFile(String storageReference) async {
    try {
      await _storage.refFromURL(storageReference).delete();
      debugPrint('File deleted: $storageReference');
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  /// Downloads the file at [storageReference] and saves it in [directory]
  ///
  /// checks if the file already exists in cache, if it exists, returns the file
  /// else, downloads the file & returns it if download was successful
  /// else, returns null
  Future<File?> downloadFile({
    required Directory directory,
    required String storageReference,
  }) async {
    final ref = _storage.ref(storageReference);
    final file = File('${directory.path}/${ref.name}');
    if (await file.exists()) {
      return file;
    }
    try {
      await ref.writeToFile(file);
      return file;
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// gets download URL of the file
  /// returns the url, if the operation is successful,
  /// returns null, if it fails to fetch the download URL
  Future<String?> getDownloadURL(String storageReference) async {
    try {
      return _storage.ref(storageReference).getDownloadURL();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
