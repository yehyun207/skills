import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefRepository {

  final SharedPreferences sharedPreferences;

  SharedPrefRepository(this.sharedPreferences);

  void saveStringList(String key, List<String> values) {
    sharedPreferences.setStringList(key, values);
  }

  List<String> getStringList(String key) {
    return sharedPreferences.getStringList(key) ?? [];
  }
}