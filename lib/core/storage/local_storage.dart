import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/core/core.dart';

class LocalStorage implements ILocalStorage {
  @override
  Future clear() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  @override
  Future delete(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  @override
  Future<String?> getByKey(String key) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key);
  }

  @override
  Future save(String key, String value) async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString(key, value);
  }
}
