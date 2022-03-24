import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/view_models/base_model.dart';

import '../../locator.dart';
import 'auth_model.dart';

class LoginModel extends BaseModel {
  ViewState _status = ViewState.Idle;
  ViewState get status => _status;
  AuthModel _authProvider = locator<AuthModel>();

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
