import 'package:firebase_auth/firebase_auth.dart';

String? isValidEmail(String email) {
  bool _isCorrectEmail =
      email.length > 1 ? isCorrectEmail.hasMatch(email) : false;
  return _isCorrectEmail ? null : 'Check your email';
}

final RegExp isCorrectEmail = RegExp(
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

Future<bool> checkIfEmailNotUse(String email) async {
  final result = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
  return result.isEmpty;
}
