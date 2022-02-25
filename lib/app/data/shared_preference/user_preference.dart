import 'package:netflix_app/app/core/constants/strings.dart';
import 'package:netflix_app/app/data/shared_preference/shared_preference.dart';

class UserPreferences {
  static final sharedPreferences = SharedPrefs.instance;

  static String getUserToken() => sharedPreferences.getString(sharedTokenId) ?? '';
  static String getUserEmail() => sharedPreferences.getString(sharedUserEmail) ?? 'error email';
  static bool getUserVerification() => sharedPreferences.getBool(sharedUserVerification) ?? false ;

  static Future<void> setUserToken(String token) => sharedPreferences.setString(sharedTokenId, token);
  static Future<void> setUserEmail(String email) => sharedPreferences.setString(sharedUserEmail, email);
  static Future<void> setUserVerification(bool verified) => sharedPreferences.setBool(sharedUserVerification, verified);
}
