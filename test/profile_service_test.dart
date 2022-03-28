import 'package:flutter_tdt/core/network/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Succes singin', () {
    // Arrange
    final auth = AuthService();
    // Act
    auth.signIn(username: 'username', password: 'password');
    // Assert
    expect(auth.user, isNotNull);
  });
}
