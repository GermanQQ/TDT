import 'package:flutter_tdt/core/providers/auth_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Succes singin', () {
    final auth = AuthProvider();
    auth.signIn(username: 'username', password: 'password');
    expect(auth.user, isNotNull);
  });
}
