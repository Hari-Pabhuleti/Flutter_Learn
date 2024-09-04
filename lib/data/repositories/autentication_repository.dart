

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:fullstack/screens/login.dart';
import 'package:fullstack/screens/onboarding.dart';
import 'package:fullstack/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:fullstack/utils/exceptions/firebase_exceptions.dart';
import 'package:fullstack/utils/exceptions/format_exceptions.dart';
import 'package:fullstack/utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AutenticationRepository extends GetxController{
  static AutenticationRepository get instance => Get.find();

  //Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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
    deviceStorage.writeIfNull('IfFirstTime', true);
    //Check if it's the first time launching the app
    deviceStorage.read('IsFirstTime') != true 
    ? Get.offAll(() => const LoginScreen()) 
    : Get.offAll(const OnBoardingScreen()); 
}


// EmailAuthentication - Register
Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
  try {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message; 
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong. Please try again';
  }
}


// Google Autentication 

Future<UserCredential?> signInWithGoogle() async {
  try {

  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message; 
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    if (kDebugMode) print('Something Went Wrong: $e');
  }
}

// LogoutUser -Valid for any autentication
Future<void> logout() async {
  try{
    await FirebaseAuth.instance.signOut();
    Get.offAll(() => const LoginScreen());
  } on FirebaseAuthException catch (e) {
    throw TFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw TFirebaseException(e.code).message; 
  } on FormatException catch (_) {
    throw const TFormatException();
  } on PlatformException catch (e) {
    throw TPlatformException(e.code).message;
  } catch (e) {
    if (kDebugMode) print('Something Went Wrong: $e');
  }
}
}