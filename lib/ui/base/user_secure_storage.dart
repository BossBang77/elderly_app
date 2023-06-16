import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:health_application/ui/signIn_page/model/login_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:health_application/ui/signIn_page/model/role_model.dart';

class UserSecureStorage {
  static final _storage = new FlutterSecureStorage();

  Future setUserData(LoginModel data) async {
    final value = json.encode(data);
    await _storage.write(key: UserKey.userData, value: value);
  }

  Future<LoginModel> getUserData() async {
    final value;

    value = await _storage.read(key: UserKey.userData);

    var data = (value == null) ? null : json.decode(value);
    return data != null ? LoginModel.fromJson(data) : LoginModel();
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

  Future<List<RoleModel>> getRole() async {
    var user = await getUserData();
    return user.role;
  }

  Future<bool> hasToken() async {
    String token = await getAccessToken();
    return token.isNotEmpty;
  }

  Future<void> clearSession() async {
    bool isClear = true;
    await _storage.deleteAll().catchError((_) => isClear = false);
  }

  Future<void> setValue({required String value, required String forKey}) async {
    return await _storage.write(key: forKey, value: value);
  }

  Future<String> getValueForKey({required String forKey}) async {
    return await _storage.read(key: forKey) ?? '';
  }

  Future getUID() async {
    LoginModel user = await getUserData();
    Map<String, dynamic> decodedToken = JwtDecoder.decode(user.accessToken);
    return decodedToken['uid'] ?? '';
  }

  Future setRecentlyExerciseSearched(List<String> value) async {
    await _storage.write(
        key: UserKey.recentlySearched, value: json.encode(value));
  }

  Future<List<String>> getRecentlyExerciseSearched() async {
    var recently = await _storage.read(key: UserKey.recentlySearched);
    List<String> list = [];

    if (recently != null) {
      list = List<String>.from(json.decode(recently));
    }

    return list;
  }

  Future setRecentlyVolunteerSearched(List<String> value) async {
    await _storage.write(
        key: UserKey.recentlySearchedVolunteer, value: json.encode(value));
  }

  Future<List<String>> getRecentlyVolunteerSearched() async {
    var recently = await _storage.read(key: UserKey.recentlySearchedVolunteer);
    List<String> list = [];

    if (recently != null) {
      list = List<String>.from(json.decode(recently));
    }

    return list;
  }
}

class UserKey {
  static String get userData => 'userData';
  static String get username => 'username';
  static String get token => 'access_token';
  static String get roleName => 'role';
  static String get roleCode => 'roleCode';
  static String get foodSearchHistory => 'foodSearchHistory';
  static String get recentlySearched => 'recently_exercise_searched';
  static String get recentlySearchedVolunteer => 'recently_volunteer_searched';
}
