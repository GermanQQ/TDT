import 'package:flutter_tdt/core/utils/utils.dart';

bool validFields(String email, String pass) =>
    isValidPassword(pass) == null && isValidEmail(email) == null;
