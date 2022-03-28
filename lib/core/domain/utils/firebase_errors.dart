String getMessageFromErrorCode(String errorCode) {
  switch (errorCode) {
    case 'ERROR_EMAIL_ALREADY_IN_USE':
    case 'account-exists-with-different-credential':
    case 'email-already-in-use':
      return 'Email already used. Go to login page.';

    case 'ERROR_WRONG_PASSWORD':
    case 'wrong-password':
      return 'Wrong login or password.';

    case 'ERROR_USER_NOT_FOUND':
    case 'user-not-found':
      return 'No user found with this email.';

    case 'ERROR_TOO_MANY_REQUESTS':
    case 'too-many-requests':
    case 'operation-not-allowed':
      return 'Too many requests to log into this account.';

    case 'ERROR_OPERATION_NOT_ALLOWED':
      return 'Server error, please try again later.';

    case 'ERROR_INVALID_EMAIL':
    case 'invalid-email':
      return 'Email address is invalid.';

    case 'network-request-failed':
      return 'Check network conection.';

    default:
      return 'Login failed. Please try again.';
  }
}