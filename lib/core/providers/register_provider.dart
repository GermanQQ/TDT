import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_tdt/core/enums/enums.dart';
import 'package:flutter_tdt/core/models/models.dart';
import 'package:flutter_tdt/core/providers/auth_provider.dart';
import 'package:flutter_tdt/core/providers/base_provider.dart';
import 'package:flutter_tdt/core/utils/utils.dart';
import 'package:flutter_tdt/locator.dart';

class RegisterProvider extends BaseProvider {
  AuthProvider _auth = locator<AuthProvider>();
  UserModel _user = UserModel();
  RegisterStep _step = RegisterStep.name;
  late AuthStatus authStatus;
  RegisterProvider() {
    authStatus = _auth.statusAuth;
  }

  final storage = new FlutterSecureStorage();
  List<RegisterMessage> messages = [
    RegisterMessage('Hi! What is your name?', MessageType.output),
  ];

  addMessage(String message, {MessageType type = MessageType.input}) async {
    if (messages.last.type == MessageType.output) {
      messages.add(RegisterMessage(message, type));
      refresh();
      await Future.delayed(Duration(milliseconds: 200));
      String? result = await _verify(message);
      if (result != null)
        messages.add(RegisterMessage(result, MessageType.output));
      refresh();
    }
  }

  Future _verify(String message) async {
    switch (_step) {
      case RegisterStep.name:
        if (isValidName(message)) {
          _user.name = message;
          _step = RegisterStep.email;
          return 'Enter your e-mail';
        } else
          return 'Check correct name, example "Alex Madonish"';
      case RegisterStep.email:
        if (isCorrectEmail.hasMatch(message)) {
          if (await checkIfEmailNotUse(message)) {
            _user.email = message;
            _step = RegisterStep.password;
            return 'Enter your password and confirm password, expample "1qazxcvb 1qazxcvb"';
          }
          else return 'This email already used! Use other.';
        } else
          return 'Check correct email, example "madonish@gmail.com"';
      case RegisterStep.password:
        List _passwords = message.split(' ');
        if (passwordCreateValidator(_passwords)) {
          String password = _passwords[0];
          if (password.length > 5) {
            await _startRegisteringUser(password);
          } else
            return "Password too short!";
        } else
          return "Passwords do not match!";
        break;
      default:
        return "Check correct data";
    }
  }

  Future<void> _startRegisteringUser(String password) async {
    authStatus = AuthStatus.Registering;
    refresh();
    bool registerSucces = await _auth.register(_user, password);
    if (!registerSucces) _registrationFailed();
    authStatus = _auth.statusAuth;
  }

  void _registrationFailed() {
    _user = UserModel();
    messages.clear();
    _step = RegisterStep.name;
    messages
        .add(RegisterMessage('Some went wrong! Try agan.', MessageType.output));
    messages.add(RegisterMessage('Hi! What is your name?', MessageType.output));
  }
}
