import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:joses_delivery_app/controller/auth_controller.dart';


class DependencyInjection {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    // await dotenv.load(fileName: ".env");
    Get.put<GetConnect>(GetConnect());
    Get.put(AuthController());
  }

  //get device id
  // final deviceInfo = DeviceInfoPlugin();
  // String? deviceID;
  // void getDeviceId() async {
  //   if (GetPlatform.isAndroid) {
  //     AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
  //     deviceID = androidInfo.id;
  //   } else {
  //     IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
  //     deviceID = iosInfo.identifierForVendor;
  //   }
  //   StorageHelper.setDeviceID(deviceID.toString());
  //   printWarning('device info: ${StorageHelper.deviceID}');
  // }
}
