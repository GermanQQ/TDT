import 'package:flutter_tdt/core/enums/enums.dart';
import 'package:flutter_tdt/core/providers/base_provider.dart';

import '../../locator.dart';
import 'auth_provider.dart';

class LoginProvider extends BaseProvider {
  ViewState _status = ViewState.Idle;
  ViewState get status => _status;
  AuthProvider _authProvider = locator<AuthProvider>();

  Future<AuthStatus> login(String email, String password) async {
    changeStatus(ViewState.Busy);
    await _authProvider.signIn(username: email, password: password);
    if(_authProvider.statusAuth != AuthStatus.Authenticated) changeStatus(ViewState.Idle);
    return _authProvider.statusAuth;
  }

  changeStatus(ViewState status) {
    _status = status;
    refresh();
  }
}
