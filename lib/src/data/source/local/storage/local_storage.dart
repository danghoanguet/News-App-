import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorage {
  late FlutterSecureStorage secureStorage;

  late _SecureKey accessToken;

  Future<void> init() async {
    secureStorage = const FlutterSecureStorage();

    accessToken = _SecureKey("accessToken", secureStorage);
  }

  ///Singleton factory
  static final LocalStorage _instance = LocalStorage._internal();

  factory LocalStorage() {
    return _instance;
  }

  LocalStorage._internal();
}

class _SecureKey {
  final String key;
  final FlutterSecureStorage storage;

  _SecureKey(this.key, this.storage);

  void set(String? value) async {
    await storage.write(key: key, value: value);
  }

  Future<String?> get() async {
    return await storage.read(key: key);
  }

  void delete() async {
    await storage.delete(key: key);
  }
}
