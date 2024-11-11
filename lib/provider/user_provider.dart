import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zoho_clone/models/user.dart';

final userProvider = StateNotifierProvider<UserNotifier, User?>(
  (ref) => UserNotifier(),
);

class UserNotifier extends StateNotifier<User?> {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;

  UserNotifier() : super(null) {
    // Listen for auth state changes and update state with custom User model
    _auth.authStateChanges().listen((firebase_auth.User? firebaseUser) {
      if (firebaseUser != null) {
        // Map Firebase user properties to your custom User instance
        state = User(
          name: firebaseUser.displayName ?? 'Anonymous',
          email: firebaseUser.email ?? '',
        );
      } else {
        state = null; // Set state to null when no user is logged in
      }
    });
  }

  // Method to get the current user (not needed as state reflects the user)
  User? getCurrentUser() {
    return state;
  }
}


// User(displayName: , email: test@gmail.com, isEmailVerified: false, isAnonymous: false,
// metadata: UserMetadata(creationTime: 2024-11-06 05:49:36.249Z, lastSignInTime: 2024-11-07 12:21:19.431Z),
// phoneNumber: , photoURL: null, providerData, [UserInfo(displayName: ,
//  email: test@gmail.com, phoneNumber: , photoURL: null, providerId: password,
//  uid: test@gmail.com)], refreshToken: null, tenantId: null, uid: cjCA2aJ7U5YSPCvYAnzUZSeT53D3)
