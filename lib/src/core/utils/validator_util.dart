import 'package:getx_clean_base/src/core/constants/regex_constant.dart';

class ValidatorUtil {
  bool isValidEmail(String email) {
    return RegexConstants.validEmailRegex.hasMatch(email);
  }

  bool isValidPass(String pass) {
    return RegexConstants.validPassword.hasMatch(pass);
  }

  bool isVietnamesePhoneNumber(String phoneNumber) {
    return RegexConstants.validPhoneRegex.hasMatch(phoneNumber);
  }
  
  bool isValidName(String name) {
    return name.isNotEmpty;
  }
}