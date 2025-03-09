class AppValidator {
  /// Validates if the given [value] is a valid email address.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid email address";
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  /// Validates if the given [value] is a valid password.
  /// A valid password must:
  /// - Be at least 8 characters long.
  /// - Contain at least one uppercase letter.
  /// - Contain at least one lowercase letter.
  /// - Contain at least one digit.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password must be at least 8 characters long";
    }
    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return "Password must contain uppercase, lowercase, and a digit";
    }
    return null;
  }
}
