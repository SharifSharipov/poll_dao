import 'package:local_auth/local_auth.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalAuthService {
  static const String _hasBiometrics = 'hasBiometrics';
  static Future<bool> checkBiometryPassed({
    required Future<void> Function() onBiometryPassed,
    required Future<bool> Function() isBiometryPassed,
  }) async {
    final result = await isBiometryPassed.call();

    if (result) {
      return true;
    }

    final pref = await SharedPreferences.getInstance();
    final hasBiometrics = pref.getBool(_hasBiometrics);

    final auth = LocalAuthentication();
    try {
      final availableBiometricsList = await auth.getAvailableBiometrics();

      if (hasBiometrics == null) {
        await pref.setBool(_hasBiometrics, availableBiometricsList.isNotEmpty);
      } else if (hasBiometrics && availableBiometricsList.isEmpty) {
        openAppSettings();
        return false;
      }
      final result = await auth.authenticate(
          localizedReason: 'You need to pass biometric authentication to access the poll',
          options: const AuthenticationOptions(stickyAuth: true, biometricOnly: true, useErrorDialogs: false));
      if (result) {
        await onBiometryPassed.call();
        // await pref.setBool(_biometryPassed, true);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
