import 'package:flutter/material.dart';
import '../views/begin_page.dart';

class SplashViewModel extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  // Updated to take BuildContext as parameter
  Future<void> initializeApp(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));
    _isLoading = false;
    notifyListeners();

    // Navigate to welcome screen
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => BeginPage()),
      );
    }
  }
}
