String? isValidPassword(String password) {
  return password.isNotEmpty ? null : "Password can't be empty!";
}

bool passwordCreateValidator(List value) {
  return value.length == 2 && value[0] == value[1];
}
