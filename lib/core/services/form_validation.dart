class FormValidator {
  static String emailValidation(String val) {
    RegExp regex = RegExp(r'[^@ \t\r\n]+@[^@ \t\r\n]+\.[^@ \t\r\n]+');
    if (val.isEmpty)
      return 'We need an email address';
    else if (!regex.hasMatch(val))
      return "That doesn't look like an email address";
    else
      return null;
  }

  static String usernameValidation(String val) {
    if (val.isEmpty)
      return 'We need a user name';
    else if (val.length < 6)
      return "User name should have at least 6 characters";
    else
      return null;
  }

  static String passwordValidation(String val) {
    RegExp hasUpper = RegExp(r'[A-Z]');
    RegExp hasLower = RegExp(r'[a-z]');
    RegExp hasDigit = RegExp(r'\d');
    RegExp hasPunct = RegExp(r'[!@#\$&*~-]');
    if (val.isEmpty) return 'We need a password';
    if (!RegExp(r'.{8,}').hasMatch(val))
      return 'Passwords must have at least 8 characters';
    if (!hasUpper.hasMatch(val))
      return 'Passwords must have at least one uppercase character';
    if (!hasLower.hasMatch(val))
      return 'Passwords must have at least one lowercase character';
    if (!hasDigit.hasMatch(val))
      return 'Passwords must have at least one number';
    if (!hasPunct.hasMatch(val))
      return 'Passwords need at least one special character like !@#\$&*~-';
    return null;
  }
}
