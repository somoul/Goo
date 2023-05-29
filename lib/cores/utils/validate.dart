import 'dart:developer';

bool validatePassword(String value) {
  RegExp regex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  if (value.isEmpty) {
    log("Please Enter password");
    return false;
  } else {
    if (!regex.hasMatch(value)) {
      log("Enter Valid password");
      return false;
    } else {
      log("Return null");
      return true;
    }
  }
}
