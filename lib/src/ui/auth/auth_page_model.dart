import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../logic/services/firebase_auth.dart';
import '../../logic/services/firebase_firestore.dart';

part 'auth_page_model.freezed.dart';

final authPageModelProvider =
    StateNotifierProvider.autoDispose<AuthPageModel, AuthPageState>(
  (ref) => AuthPageModel(
      firebaseAuth: ref.watch(firebaseAuthProvider),
      googleSignIn: ref.watch(googleAuthProvider),
      firebaseFirestore: ref.watch(firebaseFirestoreProvider)),
);

class AuthPageModel extends StateNotifier<AuthPageState> {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;
  final FirebaseFirestore firebaseFirestore;

  AuthPageModel(
      {required this.firebaseAuth,
      required this.googleSignIn,
      required this.firebaseFirestore})
      : super(const AuthPageState());
  Future<String> signin() async {
    state = state.copyWith(
      status: AuthPageStatus.authenticating,
    );
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      // final data =
      //     await firebaseFirestore.collection('emails').doc('users').get();
      // if (data.exists) {
      //   final List<dynamic> list = data.data()!['emails'];
      //   if (!list.contains(googleSignInAccount?.email)) {
      //     state = state.copyWith(
      //       status: AuthPageStatus.initial,
      //     );
      //     googleSignIn.disconnect();
      //     return 'You don\'t have access to this app';
      //   }
      // }
      GoogleSignInAuthentication? googleSignInAuthentication =
          await googleSignInAccount?.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication?.accessToken,
        idToken: googleSignInAuthentication?.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      state = state.copyWith(
        status: AuthPageStatus.authenticated,
      );
      return '';
    } catch (e) {
      state = state.copyWith(
        status: AuthPageStatus.error,
      );
      return 'Authentication Failed';
    }
  }
}

@freezed
class AuthPageState with _$AuthPageState {
  const factory AuthPageState({
    @Default(AuthPageStatus.initial) AuthPageStatus status,
    String? errorMessage,
  }) = _AuthPageState;
}

enum AuthPageStatus {
  initial,
  authenticating,
  authenticated,
  error,
}
