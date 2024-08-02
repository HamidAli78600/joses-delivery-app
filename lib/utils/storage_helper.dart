import 'package:get/get.dart';
import 'package:joses_delivery_app/utils/constants.dart';

class StorageHelper {
  static const String _accessToken = 'userAccessToken';
  static const String _userVisit = 'userVisit';
  static const String _deviceID = 'deviceID';

  // setter
  static setLoginToken(String token) {
    kStorage.write(_accessToken, token);
  }

  static _getLoginToken() {
    return kStorage.read(_accessToken) ?? '';
  }

  static removeLoginToken() {
    return kStorage.remove(_accessToken);
  }

  static setUserVisitValue(bool value) {
    kStorage.write(_userVisit, value);
  }

  static _getUserVisitValue() {
    return kStorage.read(_userVisit) ?? false;
  }

  static setDeviceID(String deviceID) {
    kStorage.write(_deviceID, deviceID);
  }

  static _getDeviceID() {
    return kStorage.read(_deviceID) ?? '';
  }

  // getter
  static String get userAccessToken => _getLoginToken();
  static String get deviceID => _getDeviceID();
  static bool get isUserVisit => _getUserVisitValue();

  set isDarkMode(bool value) => kStorage.write("isDark", value);
  bool? get isDark => kStorage.read('isDark');

  removeData() async {
    await kStorage.remove('isLoggedIn');
    await Get.deleteAll(force: true);
  }

  set isLoggedIn(bool value) => kStorage.write("isLoggedIn", value);
  bool get isLoggedIn => kStorage.read('isLoggedIn') ?? false;

  // set authData(AuthData data) => storage.write("authData", json.encode(data));

  // AuthData get authData {
  //   final parsed = json.decode(storage.read("authData") ?? "{}");
  //   return AuthData.fromJson(parsed);
  // }
}
