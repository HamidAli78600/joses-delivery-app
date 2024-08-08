import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:joses_delivery_app/utils/constants.dart';
import 'package:joses_delivery_app/utils/icons_and_images_path.dart';
import 'package:joses_delivery_app/utils/storage_helper.dart';
import 'package:joses_delivery_app/view/auth_screens/choose_user_type_screen.dart';
import 'package:joses_delivery_app/widgets/k_custom_snackbar.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    userRole.value = StorageHelper.userRole;
    precacheImage(AssetImage(AppImages.onBoardingOneImage), Get.context!);
    precacheImage(AssetImage(AppImages.onBoardingTwoImage), Get.context!);
    precacheImage(AssetImage(AppImages.loginBackground), Get.context!);
  }
  // on boarding ..............
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void nextPage() {
    if (currentPage.value < 1) {
      pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      Get.offAll(()=>ChooseUserTypeScreen());
    }
  }

  void skipOnboarding() {
    Get.offAll(()=>ChooseUserTypeScreen());
  }

  //........................

  // choose user roole screen for role selection

  var userRole = ''.obs; // Reactive RxString
  void updateUserRole(String role) {
    userRole.value = role;
    printWarning("1 check update of role: ${userRole.value}");
  }

  // .........................

  // welcome screen
  // if user as a customer role
  RxString selectedOption = ''.obs;
  // .................
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool showPassword = true.obs;
  void togglePassword() {
    showPassword.value = !showPassword.value;
    update();
  }
  // .........................

 // phone number screen
  TextEditingController phoneNumberController = TextEditingController();
  final RxString _selectedCode = '+1'.obs;
  String get selectedCode => _selectedCode.value;
  void setSelectedPhone(String value) {
    _selectedCode.value = value;
  }
//......................

// Get OTP screen ...
  TextEditingController otpController = TextEditingController();
// ......................

// User name screen ...
  TextEditingController enterFirstName = TextEditingController();
  TextEditingController enterLastName = TextEditingController();
// ......................

// Profile Screen
//   image picker functions
//   File? pickedImage;
//   Future<void> pikImage({required BuildContext context, required ImageSource imageSource}) async {
//     final picker = ImagePicker();
//     final XFile? pickedImage = await picker.pickImage(source: imageSource);
//     if(pickedImage != null){
//       croppedImage(pickedImage, context);
//     }
//     if (pickedImage == null) {
//       return;
//     }
//     update();
//   }
//   croppedImage(XFile file, BuildContext context)async{
//     var croppedFile = await ImageCropper().cropImage(
//       sourcePath: file.path,
//       aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
//       compressQuality: 40,
//       uiSettings: [
//         AndroidUiSettings(
//           toolbarTitle: 'Image Cropper',
//           toolbarColor: AppColors.primaryColor,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original,
//           lockAspectRatio: false,
//           showCropGrid: false,
//           cropFrameColor: AppColors.secondaryColor,
//           activeControlsWidgetColor: AppColors.primaryColor,
//         ),
//         IOSUiSettings(
//           title: 'Image Cropper',
//
//         ),
//       ],
//     );
//     if(croppedFile != null){
//       pickedImage = File(croppedFile.path);
//       if(pickedImage != null){
//         File? compressImage = await compressFile(pickedImage!);
//         printWarning('compressed file size${compressImage.lengthSync()}');
//         pickedImage = compressImage;
//       }
//       update();
//     }
//   }
//
//
//   Future<File> compressFile(File file) async {
//     final filePath = file.absolute.path;
//     final lastIndex = filePath.lastIndexOf(RegExp(r'.jp'));
//     final splitted = filePath.substring(0, (lastIndex));
//     final outPath = "${splitted}_out${filePath.substring(lastIndex)}";
//     var result = await FlutterImageCompress.compressAndGetFile(
//       file.absolute.path, outPath,
//       quality: 30,
//     );
//
//     print('orignal file size${file.lengthSync()}');
//     // print(result!.lengthSync());
//
//     return File(result!.path);
//   }
  RxString selectedImagePath = ''.obs;
  void pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      debugPrint('File Path: ${selectedImagePath.value}');
    } else {
      selectedImagePath.value = '';
      showCustomSnackBar('Error', 'No image selected');
    }
  }
// ........





}
