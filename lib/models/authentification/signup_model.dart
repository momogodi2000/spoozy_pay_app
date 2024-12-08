// models/signup_model.dart
class SignUpModel {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;

  SignUpModel({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });
}