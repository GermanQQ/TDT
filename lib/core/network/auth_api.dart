import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tdt/core/enums/enums.dart';
import 'package:flutter_tdt/core/models/user_model.dart';

class AuthAPI {
  final auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  Future<UserModel?> signIn(
      {required String username, required String password}) async {
    print("Autheficating");
    try {
      await auth.signInWithEmailAndPassword(
          email: username, password: password);
      final result =
          await _store.collection('users').doc(auth.currentUser!.uid).get();
      return UserModel.fromMap(result);
    } catch (e) {
      print('Unauthenticated $e');
      return null;
    }
  }

  Future<UserModel> setUserFromFirebase(UserModel _user) async {
    UserModel user = UserModel();
    if (auth.currentUser != null) {
      user.name = _user.name;
      user.email = auth.currentUser?.email;
      user.uid = auth.currentUser?.uid;
      await _store.collection('users').doc(user.uid).set(user.toMap());
    }
    return user;
  }

  Future<AuthStatus> isAuthorized() async {
    User? _userFirebase = auth.currentUser;
    return _userFirebase != null
        ? AuthStatus.Authenticated
        : AuthStatus.Unauthenticated;
  }
}
