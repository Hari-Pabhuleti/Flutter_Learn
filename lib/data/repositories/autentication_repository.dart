

import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fullstack/screens/login.dart';
import 'package:fullstack/screens/onboarding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AutenticationRepository extends GetxController{
  static AutenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();

  //Called from main.dart an app launch
  
  // Note to use the override you have to click @override dispose => void otherwise it will not initilize
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }


  //Function to show relevant screen
  screenRedirect() async {
    //Local Storage
    if (kDebugMode) {
      print('============GET STORAGE========');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IfFirstTime', true);
    deviceStorage.read('IsFirstTime') != true 
    ? Get.offAll(() => const LoginScreen()) 
    : Get.offAll(const OnBoardingScreen()); 
}
}