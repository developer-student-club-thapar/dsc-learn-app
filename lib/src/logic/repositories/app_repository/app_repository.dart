import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../models/user_data.dart';
import '../../services/firebase_auth.dart';
import '../../services/firebase_firestore.dart';
import '../../services/firebase_messaging.dart';

part 'app_repository.freezed.dart';

final appRepositoryProvider = StateNotifierProvider<AppRepository, AppState>(
  (ref) => AppRepository(
    firebaseAuth: ref.read(firebaseAuthProvider),
    firebaseFirestore: ref.read(firebaseFirestoreProvider),
    googleSignIn: ref.read(googleAuthProvider),
    ref: ref,
    firebaseMessaging: ref.read(firebaseMessagingProvider),
  ),
);

class AppRepository extends StateNotifier<AppState> {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;
  late final StreamSubscription _authSubscription;
  final GoogleSignIn googleSignIn;
  StreamSubscription? _userDataSubscription;
  StreamSubscription? _subscription;
  final FirebaseMessaging firebaseMessaging;

  final StateNotifierProviderRef ref;

  AppRepository({
    required this.firebaseAuth,
    required this.firebaseFirestore,
    required this.googleSignIn,
    required this.firebaseMessaging,
    required this.ref,
  }) : super(const AppState()) {
    _authSubscription = firebaseAuth.authStateChanges().listen((user) async {
      _userDataSubscription?.cancel();
      state = state.copyWith(
        authUser: user,
      );
      if (user == null) {
        debugPrint('user is null');
        state = state.copyWith(
          status: AppStatus.unauthenticated,
        );
      } else {
        debugPrint('user is not null');

        _userDataSubscription = firebaseFirestore
            .collection('users')
            .doc(user.uid)
            .snapshots()
            .listen((documentSnapshot) async {
          if (documentSnapshot.exists) {
            debugPrint('user data exists');

            state = state.copyWith(
              userData: UserData.fromJson(documentSnapshot.data()!),
            );
            final fcmToken = await firebaseMessaging.getToken();
            debugPrint('fcmToken: $fcmToken');
            if (fcmToken != null && fcmToken != state.userData?.fcmId) {
              _updateToken(fcmToken);
            }
            state = state.copyWith(
              status: AppStatus.authenticated,
            );
          } else {
            final fcmToken = await firebaseMessaging.getToken();
            firebaseFirestore.collection('users').doc(user.uid).set(
              {
                'userId': user.uid,
                'userName': user.displayName,
                'email': user.email,
                'profilePicUrl': user.photoURL,
                'yearOfStudy': '2026',
                "fcmId": fcmToken,
                "roleId": 2,
              },
            );
            state = state.copyWith(
              status: AppStatus.authenticated,
            );
          }
        });
      }
    });
  }

  void logout() async {
    _removeToken();

    await googleSignIn.disconnect();
    await firebaseAuth.signOut();
  }

  void _updateToken(String token) {
    final authUser = state.authUser;
    if (authUser != null) {
      //store fcm toke to user collection
      if (state.lastFcmIDUpdatedAt != null) {
        if (state.lastFcmIDUpdatedAt!.compareTo(
                DateTime.now().subtract(const Duration(minutes: 1))) <
            0) {
          firebaseFirestore.collection('users').doc(authUser.uid).set(
            {
              'fcmId': token,
            },
            SetOptions(
              merge: true,
            ),
          );
          state = state.copyWith(lastFcmIDUpdatedAt: DateTime.now());
        }
      } else {
        firebaseFirestore.collection('users').doc(authUser.uid).set(
          {
            'fcmId': token,
          },
          SetOptions(
            merge: true,
          ),
        );
        state = state.copyWith(lastFcmIDUpdatedAt: DateTime.now());
      }
    }
  }

  /// removes user's FCM token from Firestore
  _removeToken() async {
    final authUser = state.authUser;
    if (authUser != null) {
      // cancel user data subscription
      _userDataSubscription?.cancel();
      //store fcm toke to user collection
      await firebaseFirestore.collection('users').doc(authUser.uid).set(
        {
          'fcmId': null,
        },
        SetOptions(
          merge: true,
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();

    _authSubscription.cancel();
    _userDataSubscription?.cancel();
    _subscription?.cancel();
  }
}

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(null) User? authUser,
    @Default(null) UserData? userData,
    @Default(AppStatus.initial) AppStatus status,
    @Default(null) DateTime? lastFcmIDUpdatedAt,
  }) = _AppState;
}

enum AppStatus {
  initial,
  unauthenticated,
  authenticated,
}
