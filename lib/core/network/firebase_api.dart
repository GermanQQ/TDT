import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tdt/core/models/user_model.dart';

class FirebaseAPI {
  static const String usersCollection = 'users';

  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  User? get _user => _auth.currentUser;

  Future<UserModel?> isAuthorized() async {
    if (_user != null) {
      return await getUser(_user!.uid);
    } else {
      return null;
    }
  }

  Future<void> register(String username, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: username, password: password);
    } catch (_) {
      rethrow;
    }
  }

  Future<UserModel?> signIn(String username, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      final firebaseUser = credentials.user;
      if (firebaseUser != null) {
        return await getUser(firebaseUser.uid);
      }
    } catch (e) {
      log('Error signIn:', error: e);
      rethrow;
    }
    return null;
  }

  void signOut() {
    _auth.signOut();
  }

  Future<UserModel> getUser(String uid) async {
    final result = await _store.collection(usersCollection).doc(uid).get();
    return UserModel.fromMap(result);
  }

  Future<void> setUser(UserModel user) async {
    //when register user
    user.uid = _user?.uid;
    if (user.uid != null) {
      await _store.collection(usersCollection).doc(user.uid).set(user.toMap());
    }
  }
}
