import 'package:flutter_tdt/core/view_models/auth_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Succes singin', () {
    final auth = AuthModel();
    auth.signIn(username: 'username', password: 'password');
    expect(auth.user, isNotNull);
  });
}
