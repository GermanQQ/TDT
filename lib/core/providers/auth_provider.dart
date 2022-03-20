import 'package:flutter_tdt/core/enums/enums.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/services/auth_api.dart';

import '../../locator.dart';
import '../models/models.dart';
import 'base_provider.dart';

class AuthProvider extends BaseProvider {
  AuthAPI _authAPI = locator<AuthAPI>();
  AuthStatus _status = AuthStatus.Uninitialized;
  UserModel? _user;

  AuthStatus get statusAuth => _status;
  UserModel? get user => _user;

  appStarted() async {
    print('AppStarted');
    changeStatus(AuthStatus.Authenticating);
    await Future.delayed(Duration(seconds: 2));
    changeStatus(await _authAPI.isAuthorized());
  }

  changeStatus(AuthStatus status) {
    print(_status.toString() + ' ===> ' + status.toString());
    _status = status;
    refresh();
  }

  Future<void> signIn(
      {required String username, required String password}) async {
    changeStatus(AuthStatus.Authenticating);
    _user = await _authAPI.signIn(username: username, password: password);
    changeStatus(
        _user != null ? AuthStatus.Authenticated : AuthStatus.Unauthenticated);
  }

  Future<bool> register(UserModel _user, String password) async {
    try {
      await _authAPI.auth.createUserWithEmailAndPassword(
          email: _user.email ?? 'none', password: password);
      _user = await _authAPI.setUserFromFirebase(_user);
      await signIn(username: _user.email ?? 'none', password: password);
      return _status == AuthStatus.Authenticated;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future signOut() async {
    _authAPI.auth.signOut();
    _user = UserModel();
    _status = AuthStatus.Logout;
    locator<Routes>().tapOnLogin(true);
  }
}
