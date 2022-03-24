import 'package:flutter_tdt/core/domain/utils/utils.dart';

bool validFields(String email, String pass) =>
    isValidPassword(pass) == null && isValidEmail(email) == null;
