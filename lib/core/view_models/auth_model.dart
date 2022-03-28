import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/domain/utils/firebase_errors.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/network/auth_service.dart';

import '../../locator.dart';
import 'base_model.dart';

class AuthModel extends BaseModel {
  final _authService = locator<AuthService>();
  AuthStatus _status = AuthStatus.Uninitialized;
  String? _errorMessage;

  AuthStatus get statusAuth => _status;
  String? get error => _errorMessage;

  appStarted() async {
    log('AppStarted');
    changeStatus(AuthStatus.Authenticating);
    changeStatus(await _authService.isAuthorized());
  }

  changeStatus(AuthStatus status) {
    log(_status.toString() + ' ===> ' + status.toString());
    _status = status;
    refresh();
  }

  Future<void> onPressSignIn(String username, String password) async {
    changeStatus(AuthStatus.Authenticating);
    try {
      await _authService.signIn(username: username, password: password);
      changeStatus(AuthStatus.Authenticated);
    } on FirebaseAuthException catch (e) {
      changeStatus(AuthStatus.Failed);
      _errorMessage = getMessageFromErrorCode(e.code);
    } catch (_) {
      changeStatus(AuthStatus.Failed);
      _errorMessage = 'Some went wrong!';
    }
  }

  Future<void> onPressSignOut() async {
    _authService.signOut();
    _status = AuthStatus.Unauthenticated;
    locator<Routes>().tapOnLogin(true);
    locator<Routes>().currentIndex = 1;
  }
}
