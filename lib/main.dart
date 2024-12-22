import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ViewModel/dashbaord/dashboard_viewmodel.dart';
import 'ViewModel/dashbaord/main_dashboard.dart';
import 'ViewModel/deposits/deposit_view_model.dart';
import 'ViewModel/loan/loan_view_model.dart';
import 'ViewModel/menu/menu_view_model.dart';
import 'ViewModel/splash_view_model.dart';
import 'views/splash_screen.dart';
import 'views/loan/loan_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final bool isSpoozyPay = true; // Change this condition based on your requirements

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => LoanViewModel()),
        ChangeNotifierProvider(create: (_) => MenuViewModel()),
        ChangeNotifierProvider(create: (_) => maindashboard()),
        ChangeNotifierProvider(create: (_) => DepositViewModel()),


      ],
      child: MaterialApp(
        title: isSpoozyPay ? 'Spoozy Pay' : 'Loan Management',
        theme: isSpoozyPay ? spoozyPayTheme() : loanManagementTheme(),
        darkTheme: isSpoozyPay ? spoozyPayDarkTheme() : loanManagementDarkTheme(),
        home: isSpoozyPay ? SplashScreen() : LoanListScreen(),

      ),
    );
  }

  ThemeData spoozyPayTheme() {
    return ThemeData(
      primaryColor: Color(0xFF4854EE),
      scaffoldBackgroundColor: Color(0xFFF5F6FA),
      cardColor: Colors.white,
      useMaterial3: true,
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  ThemeData spoozyPayDarkTheme() {
    return ThemeData(
      primaryColor: Color(0xFF4854EE),
      scaffoldBackgroundColor: Colors.black,
      cardColor: Colors.grey[900],
      useMaterial3: true,
      textTheme: TextTheme(
        headlineMedium: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          color: Colors.grey[400],
        ),
      ),
    );
  }

  ThemeData loanManagementTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  ThemeData loanManagementDarkTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: Colors.grey[900],
      appBarTheme: const AppBarTheme(
        color: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
