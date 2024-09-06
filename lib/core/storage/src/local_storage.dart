import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/core/storage/src/local_storage.interface.dart';

class LocalStorage implements ILocalStorage {
  final SharedPreferences sharedPreferences = Modular.get<SharedPreferences>();
  @override
  Future clear() async {
    await sharedPreferences.clear();
  }

  @override
  Future delete(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  String? getByKey(String key) {
    return sharedPreferences.getString(key);
  }

  @override
  Future save(String key, value) async {
    await sharedPreferences.setString(key, value);
  }
}
