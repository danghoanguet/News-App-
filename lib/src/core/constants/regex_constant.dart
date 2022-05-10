class RegexConstants {
  static final RegExp hasDigitRegex = RegExp(r'[0-9]');
  static final RegExp hasLowerCaseRegex = RegExp(r'[a-z]');
  static final RegExp hasUpperCaseRegex = RegExp(r'[A-Z]');
  static final RegExp alphabetRegex = RegExp(r'[a-zA-Z]');
  static final RegExp validPhoneBook =
      RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]');

  static final RegExp validPhoneRegex =
      RegExp(r'^[0-9]{8,17}$'); //Phone number should be in range 8 to 17 chars

  static final RegExp validPassword = RegExp(
      r'^(?=.*?[A-Za-z])(?=.*?[0-9]).{6,}$'); // Minimum 6 characters, at least one letter and one number:

  static final RegExp hasSpaceCharacter =
      RegExp(r' '); //Phone number should be in range 3 to 15 chars

  static final RegExp validEmailRegex = RegExp(
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$'); // I got Regex pattern from this https://stackoverflow.com/a/50663835

  static final RegExp hasOnlyDigitRegex = RegExp(r'^[0-9]*$');
  static final RegExp hasOnlyAlphabetsRegex = RegExp(r'^[a-zA-Z]*$');
  static final RegExp hasOnlyAlphanumericWithAtLeastOneAlphabetRegex =
      RegExp(r'^\d*[a-zA-Z][a-zA-Z0-9]*$');
  static final RegExp hasSpecialCharacterRegex = RegExp(r'[\W_]');
}
