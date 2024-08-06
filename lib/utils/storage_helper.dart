import 'package:get/get.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';
import 'package:joses_delivery_app/utils/constants.dart';

class StorageHelper {
  static const String _accessToken = 'userAccessToken';
  static const String _userRole = 'userRole';
  static const String _deviceID = 'deviceID';

  // login token
  static setLoginToken(String token) {
    kStorage.write(_accessToken, token);
  }

  static _getLoginToken() {
    return kStorage.read(_accessToken) ?? '';
  }

  static removeLoginToken() {
    return kStorage.remove(_accessToken);
  }

  // user role
  static setUserRole(String value) {
    kStorage.write(_userRole, value);
    Get.find<AuthController>().updateUserRole(value); // Update the AuthController
  }

  static _getUserRoleValue() {
    return kStorage.read(_userRole) ?? 'none';
  }

  // device id
  static setDeviceID(String deviceID) {
    kStorage.write(_deviceID, deviceID);
  }

  static _getDeviceID() {
    return kStorage.read(_deviceID) ?? '';
  }

  // getter
  static String get userAccessToken => _getLoginToken();
  static String get deviceID => _getDeviceID();
  static String get userRole => _getUserRoleValue();


  set isDarkMode(bool value) => kStorage.write("isDark", value);
  bool? get isDark => kStorage.read('isDark');

  removeData() async {
    await kStorage.remove('isLoggedIn');
    await Get.deleteAll(force: true);
  }

  static Future<void> clearRole() async {
    await kStorage.remove(_userRole);
    Get.find<AuthController>().updateUserRole('none');
  }


  set isLoggedIn(bool value) => kStorage.write("isLoggedIn", value);
  bool get isLoggedIn => kStorage.read('isLoggedIn') ?? false;

  // set authData(AuthData data) => storage.write("authData", json.encode(data));

  // AuthData get authData {
  //   final parsed = json.decode(storage.read("authData") ?? "{}");
  //   return AuthData.fromJson(parsed);
  // }
}
