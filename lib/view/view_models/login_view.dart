import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/domain/utils/firebase_errors.dart';
import 'package:flutter_tdt/core/services/auth_service.dart';

import '../../locator.dart';
import 'base_view.dart';

class LoginView extends BaseView {
  final _authService = locator<AuthService>();
  bool _hasError = false;
  String _errorMessage = 'Some went wrong!';

  String get errorMessage => _errorMessage;
  bool get hasError => _hasError;

  appStarted() async {
    log('AppStarted');
    await _authService.initial();
  }

  Future<void> onPressSignIn(String username, String password) async {
    applyState(ViewState.Busy);
    try {
      await _authService.signIn(username, password);
      applyState(ViewState.Idle);
    } on FirebaseAuthException catch (e) {
      _setError(getMessageFromErrorCode(e.code));
    } catch (_) {
      _setError('Some went wrong!');
    }
  }

  Future<void> onPressSignOut() async {
    _authService.signOut();
  }

  _setError(String message) {
    _errorMessage = message;
    _hasError = true;
    applyState(ViewState.Idle);
    Future.delayed(const Duration(seconds: 1), () => _hasError = false);
  }
}
