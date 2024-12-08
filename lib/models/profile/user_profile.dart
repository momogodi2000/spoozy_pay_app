class User_profile {
  final String name;
  final String email;
  final String phone;
  final String birthDate;
  final String address;
  final String language;
  final bool notificationsEnabled;
  final bool faceIdEnabled;

  User_profile({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDate,
    required this.address,
    required this.language,
    this.notificationsEnabled = false,
    this.faceIdEnabled = false,
  });
}
