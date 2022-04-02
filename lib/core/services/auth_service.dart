import 'dart:developer';
import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/models/user_model.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/network/firebase_api.dart';
import 'package:flutter_tdt/locator.dart';

class AuthService {
  final _api = locator<FirebaseAPI>();
  AuthStatus _status = AuthStatus.Uninitialized;
  UserModel? _user;

  UserModel? get user => _user;
  AuthStatus get authStatus => _status;
  AuthStatus get _isAuthorized =>
      _user != null ? AuthStatus.Authenticated : AuthStatus.Unauthenticated;

  Future<void> initial() async {
    changeStatus(await isAuthorized());
  }

  Future<void> signIn(String username, String password) async {
    log('Autheficating');
    try {
      _user = await _api.signIn(username, password);
      changeStatus(_isAuthorized);
    } catch (_) {
      rethrow;
    }
  }

  Future<AuthStatus> isAuthorized() async {
    _user = await _api.isAuthorized();
    return _user != null
        ? AuthStatus.Authenticated
        : AuthStatus.Unauthenticated;
  }

  void signOut() {
    _api.signOut();
    _user = null;
    _status = AuthStatus.Unauthenticated;
    locator<Routes>().logOut();
  }

  Future<bool> registerUser(UserModel user, String password) async {
    String? userEmail = user.email;
    try {
      if (userEmail != null) {
        await _api.register(userEmail, password);
        _api.setUser(user);
        _user = await _api.signIn(userEmail, password);
        changeStatus(_isAuthorized);
      }
    } catch (_) {
      rethrow;
    }

    return _user != null;
  }

  changeStatus(AuthStatus status) {
    log(authStatus.toString() + ' ===> ' + status.toString());
    _status = status;
    locator<Routes>().refresh();
  }
}
