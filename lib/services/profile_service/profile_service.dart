
class ProfileService {
  final LocalAuthentication auth = LocalAuthentication();

  Future<bool> enableFaceId() async {
    bool canCheckBiometrics = await auth.canCheckBiometrics;
    if (canCheckBiometrics) {
      return await auth.authenticate(
          localizedReason: 'Please authenticate to enable Face ID');
    }
    return false;
  }
}

class LocalAuthentication {
  get canCheckBiometrics => null;

  authenticate({required String localizedReason}) {}
}
