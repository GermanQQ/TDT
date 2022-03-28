import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/models/user_model.dart';

class AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore store = FirebaseFirestore.instance;
  
  UserModel? _user;
  UserModel? get user => _user;

  Future<bool> signIn(
      {required String username, required String password}) async {
    log('Autheficating');
    try {
      final credentials = await auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      final firebaseUser = credentials.user;
      if (firebaseUser != null) {
        _user = await getUserFromFirestore(firebaseUser.uid);
      }
      return _user != null ? true : false;
    } catch (e) {
      log('Error signIn:', error: e);
      rethrow;
    }
  }

  Future<AuthStatus> isAuthorized() async {
    final firebaseUser = auth.currentUser;
    if (firebaseUser != null) {
      _user = await getUserFromFirestore(firebaseUser.uid);
      return AuthStatus.Authenticated;
    } else {
      return AuthStatus.Unauthenticated;
    }
  }

  void signOut() {
    auth.signOut();
    _user = null;
  }

  Future<bool> registerUser(UserModel user, String password) async {
    String? userEmail = user.email;
    if (userEmail != null) {
      final credentials = await auth.createUserWithEmailAndPassword(
          email: userEmail, password: password);
      final firebaseUser = credentials.user;
      if (firebaseUser != null) {
        setUserToFirestore(user, firebaseUser);
        _user = await getUserFromFirestore(firebaseUser.uid);
        return _user != null;
      }
    }
    return false;
  }

  Future<void> setUserToFirestore(UserModel user, User firebaseUser) async {
    user.uid = firebaseUser.uid;
    await store.collection('users').doc(user.uid).set(user.toMap());
  }

  Future<UserModel> getUserFromFirestore(String uid) async {
    final result = await store.collection('users').doc(uid).get();
    return UserModel.fromMap(result);
  }
}
