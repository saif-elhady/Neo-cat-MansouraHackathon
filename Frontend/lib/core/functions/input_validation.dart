String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Email is required';
  }
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
  if (!emailRegex.hasMatch(value)) {
    return 'Enter a valid email';
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }
  if (value.length < 6) {
    return 'Password must be at least 6 characters long';
  }
  return null;
}

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return 'Name is required';
  }
  if (value.length < 3) {
    return 'Name must be at least 3 characters long';
  }
  return null;
}

String? validateIncome(String? value) {
  if (value == null || value.isEmpty) {
    return 'Income is required';
  }
  final income = double.tryParse(value);
  if (income == null || income < 0) {
    return 'Enter a valid positive income';
  }
  return null;
}

String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  final phoneRegex = RegExp(r'^[0-9]{11}$');
  if (!phoneRegex.hasMatch(value)) {
    return 'Enter a valid 11-digit phone number';
  }
  return null;
}

String? validateNationalId(String? value) {
  if (value == null || value.isEmpty) {
    return 'National ID is required';
  }
  final idRegex = RegExp(r'^\d{10}$');
  if (!idRegex.hasMatch(value)) {
    return 'Enter a valid 10-digit national ID';
  }
  return null;
}

String? validateJobTitle(String? value) {
  if (value == null || value.isEmpty) {
    return 'Job title is required';
  }
  if (value.length < 2) {
    return 'Job title must be at least 2 characters long';
  }
  if (value.length > 50) {
    return 'Job title must be less than 50 characters';
  }
  return null;
}

String? validateBalance(String? value) {
  if (value == null || value.isEmpty) {
    return 'Balance is required';
  }

  final numericRegex = RegExp(r'^[0-9]+$');
  if (!numericRegex.hasMatch(value)) {
    return 'Please enter only numbers';
  }

  return null;
}
