import 'package:get_storage/get_storage.dart';

class LocalStorageData {
  LocalStorageData._privateConstructor();

  static final LocalStorageData instance = LocalStorageData._privateConstructor();

  final _box = GetStorage();

  Future<void> save(String key ,dynamic data) async {
    await _box.write(key, data);
  }

  Future<dynamic> getData(String key) async {
    return await _box.read(key);
  }

  Future<void> delete(String key) async {
    await _box.remove(key);
  }
}
