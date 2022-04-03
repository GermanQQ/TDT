import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/models/models.dart';
import 'package:flutter_tdt/core/domain/utils/utils.dart';
import 'package:flutter_tdt/core/services/auth_service.dart';
import 'package:flutter_tdt/locator.dart';
import 'package:flutter_tdt/view/view_models/base_view.dart';

class RegisterView extends BaseView {
  UserModel _userWrapper = UserModel();
  RegisterStep _step = RegisterStep.name;

  final List<RegisterMessage> messages = [
    RegisterMessage('Hi! What is your name?', MessageType.output),
  ];

  addMessage(String message, {MessageType type = MessageType.input}) async {
    if (messages.last.type == MessageType.output) {
      messages.add(RegisterMessage(message, type));
      refresh();
      await Future.delayed(const Duration(milliseconds: 200));
      String? result = await _verify(message);
      if (result != null) {
        messages.add(RegisterMessage(result, MessageType.output));
      }
      refresh();
    }
  }

  Future _verify(String message) async {
    switch (_step) {
      case RegisterStep.name:
        return _verifyNameFromInput(message);
      case RegisterStep.email:
        return await _verifyEmailFromInput(message);
      case RegisterStep.password:
        return await _verifyPasswordFromInput(message);
      default:
        return 'Check correct data';
    }
  }

  Future<void> _startRegisteringUser(String password) async {
    applyState(ViewState.Busy);
    bool registerSucces = await _registerCallBack(_userWrapper, password);
    if (!registerSucces) {
      _registrationFailed();
      applyState(ViewState.Idle);
    }
  }

  void _registrationFailed() {
    _userWrapper = UserModel();
    messages.clear();
    _step = RegisterStep.name;
    messages
        .add(RegisterMessage('Some went wrong! Try agan.', MessageType.output));
    messages.add(RegisterMessage('Hi! What is your name?', MessageType.output));
  }

  Future<bool> _registerCallBack(UserModel _user, String password) async {
    try {
      return await locator<AuthService>().registerUser(_user, password);
    } catch (_) {
      return false;
    }
  }

  String _verifyNameFromInput(String message) {
    if (isValidName(message)) {
      _userWrapper.name = message;
      _step = RegisterStep.email;
      return 'Enter your e-mail';
    } else {
      return 'Check correct name, example "Alex Madonish"';
    }
  }

  Future<String> _verifyEmailFromInput(String message) async {
    if (isCorrectEmail.hasMatch(message)) {
      if (await checkIfEmailNotUse(message)) {
        _userWrapper.email = message;
        _step = RegisterStep.password;
        return 'Enter your password and confirm password, expample "1qazxcvb 1qazxcvb"';
      } else {
        return 'This email already used! Use other.';
      }
    } else {
      return 'Check correct email, example "madonish@gmail.com"';
    }
  }

  Future<String?> _verifyPasswordFromInput(String message) async {
    List _passwords = message.split(' ');
    if (passwordCreateValidator(_passwords)) {
      String password = _passwords[0];
      if (password.length > 5) {
        await _startRegisteringUser(password);
      } else {
        return 'Password too short!';
      }
    } else {
      return 'Passwords do not match!';
    }
    return null;
  }
}
