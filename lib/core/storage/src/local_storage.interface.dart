abstract interface class ILocalStorage {
  Future save(String key, dynamic value);
  Future delete(String key);
  Future clear();
  String? getByKey(String key);
}
