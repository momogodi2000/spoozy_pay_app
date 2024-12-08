// viewmodels/signup_viewmodel.dart
import 'package:flutter/material.dart';

class SignUpViewModel extends ChangeNotifier {
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  bool _isLoading = false;
  bool _showPassword = false;
  bool _showConfirmPassword = false;

  // Getters
  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get confirmPassword => _confirmPassword;
  bool get isLoading => _isLoading;
  bool get showPassword => _showPassword;
  bool get showConfirmPassword => _showConfirmPassword;

  // Setters with validation
  void setName(String value) {
    _name = value;
    notifyListeners();
  }

  void setEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void setPassword(String value) {
    _password = value;
    notifyListeners();
  }

  void setConfirmPassword(String value) {
    _confirmPassword = value;
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _showPassword = !_showPassword;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    _showConfirmPassword = !_showConfirmPassword;
    notifyListeners();
  }

  bool get isValid {
    return _name.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty &&
        _confirmPassword.isNotEmpty &&
        _password == _confirmPassword;
  }

  Future<void> signUp() async {
    if (!isValid) return;

    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
  }
}
