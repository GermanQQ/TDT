String? isValidPassword(String password) {
  return password.length > 0 ? null : "Password can't be empty!";
}

bool passwordCreateValidator(List value) {
  if (value.length == 2 && value[0] == value[1]) {
    return true;
  } else
    return false;
}
