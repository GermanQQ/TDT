import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tdt/core/models/slider_item_data.dart';
import 'package:flutter_tdt/core/models/user_model.dart';
import 'package:flutter_tdt/core/services/language_service.dart';

class FirebaseAPI {
  static const String usersCollection = 'users';
  static const String sourceCollection = 'source';

  final _auth = FirebaseAuth.instance;
  final _store = FirebaseFirestore.instance;

  UserModel? _user;

  UserModel? get user => _user;
  String get _langCode =>
      LanguageService.lang?.languageCode ??
      LanguageService.defautlLang.languageCode;
  String get _defaultLangCode => LanguageService.defautlLang.languageCode;

  Future<void> initialize() async {
    await _isAuthorized();
  }

  Future<void> _isAuthorized() async {
    if (_auth.currentUser != null) {
      _user = await getUser(_auth.currentUser!.uid);
    } else {
      _user = null;
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

  Future<void> signIn(String username, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );
      final firebaseUser = credentials.user;
      if (firebaseUser != null) {
        _user = await getUser(firebaseUser.uid);
      }
    } catch (e) {
      log('Error signIn:', error: e);
      rethrow;
    }
  }

  void signOut() {
    _user = null;
    _auth.signOut();
  }

  Future<UserModel> getUser(String uid) async {
    final result = await _store.collection(usersCollection).doc(uid).get();
    return UserModel.fromMap(result);
  }

  Future<void> setUser(UserModel user) async {
    //when register user
    user.uid = _auth.currentUser?.uid;
    if (user.uid != null) {
      await _store.collection(usersCollection).doc(user.uid).set(user.toMap());
    }
  }

  Future<List<SliderItemData>> getSliderData() async {
    List<SliderItemData> data = [];

    final response =
        await _store.collection(sourceCollection).doc('slider').get();

    final result = response.data();

    if (result != null && result.isNotEmpty) {
      if (result.containsKey(_langCode)) {
        result[_langCode]
            .forEach((el) => data.add(SliderItemData.fromJson(el)));
      } else if (result.containsKey(_defaultLangCode)) {
        result[_defaultLangCode]
            .forEach((el) => data.add(SliderItemData.fromJson(el)));
      }
    }
    return data;
  }
}
