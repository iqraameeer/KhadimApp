import 'package:get/get.dart';

String? requiredFieldValidator(String? value, String fieldName) {
  if (value == null || value.trim().isEmpty) {
    return 'Please fill the $fieldName field';
  }
  return null;
}

String? passwordValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please fill the password field';
  } else if (value.length < 3) {
    return 'Password is invalid';
  }
  return null;
}

String? confirmPasswordValidator(String? value, String? password) {
  if (value == null || value.isEmpty) {
    return 'Please confirm your password';
  } else if (value != password) {
    return 'Passwords do not match';
  }
  return null;
}

String? userNameValidator(String? value) {
  if (value == null || value.trim().isEmpty) {
    return 'Please fill the username field';
  } else if (value.length < 3) {
    return 'Username is invalid';
  }
  return null;
}

String? numberValidator(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return 'Please enter a $fieldName';
  } else if (!GetUtils.isNumericOnly(value)) {
    return 'Please enter a valid number';
  }
  return null;
}

String? emailValidator(String? value) {
  if (value != null && value.isNotEmpty && !GetUtils.isEmail(value.trim())) {
    return 'Please enter a valid email address';
  }
  return null;
}

String? nicValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an NIC number';
  } else if (!RegExp(r'^\d{5}-\d{7}-\d{1}$').hasMatch(value)) {
    return 'Please enter a valid NIC (e.g., 12345-1234567-1)';
  }
  return null;
}

String? dropdownValidator(String? value, String fieldName) {
  if (value == null || value.isEmpty) {
    return 'Please select a $fieldName';
  }
  return null;
}

String? dateValidator(DateTime? date, String fieldName) {
  if (date == null) {
    return 'Please select a $fieldName';
  }
  return null;
}
