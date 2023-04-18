import 'package:shared_preferences/shared_preferences.dart';

class PREF {
  PREF._();
  static final PREF instance = PREF._();
  SharedPreferences? _prefs;
  Future<SharedPreferences> get prefs async {
    if (_prefs != null) return _prefs!;
    _prefs = await SharedPreferences.getInstance();
    return _prefs!;
  }
  static const String appColor = 'appColor';
  static const String isDark = "dark";
}