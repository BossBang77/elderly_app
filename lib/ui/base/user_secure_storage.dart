import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static final _storage = new FlutterSecureStorage();

  Future setUserData(var data) async {
    final value = json.encode(data);

    await _storage.write(key: UserKey.userData, value: value);
  }

  Future<dynamic> getUserData() async {
    final value;

    value = await _storage.read(key: UserKey.userData);

    var data = (value == null) ? null : json.decode(value);
    // return data != null ? LoginADFSModel.fromJson(data) : LoginADFSModel.empty;
  }

  Future<bool> setAccessToken(String token) async {
    bool isSuccess = true;

    await _storage
        .write(key: UserKey.token, value: token)
        .catchError((error) => isSuccess = false);

    return isSuccess;
  }

  Future getAccessToken() async {
    return await _storage.read(key: UserKey.token) ?? '';
  }

  Future<bool> hasToken() async {
    String token = await getAccessToken();
    return token.isNotEmpty;
  }

  Future<void> clearSession() async {
    bool isClear = true;
    await _storage.deleteAll().catchError((_) => isClear = false);
  }
}

class UserKey {
  static String get userData => 'userData';
  static String get username => 'username';
  static String get token => 'access_token';
  static String get roleName => 'role';
  static String get roleCode => 'roleCode';
}
