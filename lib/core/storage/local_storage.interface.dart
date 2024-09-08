abstract interface class ILocalStorage {
  Future save(String key, String value);
  Future delete(String key);
  Future clear();
  Future<String?> getByKey(String key);
}
