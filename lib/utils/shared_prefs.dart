import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  // Singleton pattern
  SharedPreferenceHelper._privateConstructor();

  /// The singleton pattern ensures that a class has only one instance throughout the lifetime of the app and provides a global access point to that instance.

  static final SharedPreferenceHelper instance =
      SharedPreferenceHelper._privateConstructor();

  /// Saving Login Status
  Future<bool> setLogin(bool isLogin) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool('isLogin', isLogin);
  }

  Future<bool> getIsLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLogin') ?? false;
  }
}
