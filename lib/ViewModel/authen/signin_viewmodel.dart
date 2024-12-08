// viewmodels/signin_viewmodel.dart
import 'package:flutter/material.dart';

class SignInViewModel extends ChangeNotifier {
  String _email = '';
  String _password = '';
  bool _rememberMe = false;
  bool _isLoading = false;

  String get email => _email;
  String get password => _password;
  bool get rememberMe => _rememberMe;
  bool get isLoading => _isLoading;

  void setEmail(String email) {
    _email = email;
    notifyListeners();
  }

  void setPassword(String password) {
    _password = password;
    notifyListeners();
  }

  void setRememberMe(bool value) {
    _rememberMe = value;
    notifyListeners();
  }

  Future<void> signIn() async {
    _isLoading = true;
    notifyListeners();

    // Simulate API call
    await Future.delayed(const Duration(seconds: 2));

    _isLoading = false;
    notifyListeners();
  }
}

