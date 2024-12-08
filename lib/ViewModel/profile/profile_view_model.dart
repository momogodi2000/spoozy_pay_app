import '../../models/profile/user_profile.dart';
import '../../services/profile_service/profile_service.dart';

class ProfileViewModel {
  ProfileService _profileService = ProfileService();
  User_profile _user = User_profile(
    name: "Payton Parks",
    email: "paytonparks@mail.com",
    phone: "+17 | xxxxxxxxxx",
    birthDate: "MM/DD/YYYY",
    address: "Enter your address",
    language: "English",
  );

  User_profile get user => _user;

  void toggleNotifications() {
    _user = User_profile(
      name: _user.name,
      email: _user.email,
      phone: _user.phone,
      birthDate: _user.birthDate,
      address: _user.address,
      language: _user.language,
      notificationsEnabled: !_user.notificationsEnabled,
      faceIdEnabled: _user.faceIdEnabled,
    );
  }

  Future<void> toggleFaceId() async {
    bool success = await _profileService.enableFaceId();
    if (success) {
      _user = User_profile(
        name: _user.name,
        email: _user.email,
        phone: _user.phone,
        birthDate: _user.birthDate,
        address: _user.address,
        language: _user.language,
        notificationsEnabled: _user.notificationsEnabled,
        faceIdEnabled: !_user.faceIdEnabled,
      );
    }
  }
}
