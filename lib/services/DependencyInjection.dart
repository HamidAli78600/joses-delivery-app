import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class DependencyInjection {
  static void init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await GetStorage.init();
    // await dotenv.load(fileName: ".env");
    Get.put<GetConnect>(GetConnect());
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
