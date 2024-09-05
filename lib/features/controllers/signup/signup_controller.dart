import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fullstack/data/models/user_model.dart';
import 'package:fullstack/data/repositories/autentication_repository.dart';
import 'package:fullstack/data/repositories/user_repository.dart';
import 'package:fullstack/screens/signup/verify_email.dart';
import 'package:fullstack/utils/constants/colors.dart';
import 'package:fullstack/utils/constants/image_strings.dart';
import 'package:fullstack/utils/constants/sizes.dart';
import 'package:fullstack/utils/helpers/helper_functions.dart';
import 'package:fullstack/utils/helpers/network_manager.dart';
import 'package:fullstack/utils/helpers/t_loader.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //Variables
  final hidePassword = true.obs;
  final privacypolicy = true.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  //Signup
  void signup() async {
    try {

    TFullScreenLoader.openLoadingDialog('We are processing your information...', TImages.appleLogo); //To-do : replace the logo

    //Check Internet Connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      //Remove Loader
      TFullScreenLoader.stopLoading();
      return;
    }
    

    //Form validation
    if (!signupFormKey.currentState!.validate()) 
    {
      TFullScreenLoader.stopLoading();
      return;
    }

    //Privacy Policy Check
    if(!privacypolicy.value) {
      TLoaders.warningSnackBar(title: 'Accept Privacy Policy',
      message: 'In order to create account, you must have to read and accept the privacy policy & Terms of use');
      return;
    }

    // register user in the firebase Authentication & save user date in firebase
    final UserCredential= await AutenticationRepository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());


    final newUser =UserModel(
      id: UserCredential.user!.uid,
firstName:firstName.text.trim(),
lastName:lastName.text.trim(),
username:username.text.trim(),
email:email.text.trim(),
phoneNumber:phoneNumber.text.trim(),
profilePicture: '' ,

    );

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

    // remove loader
    TFullScreenLoader.stopLoading();

  //Show Success Message
  TLoaders.successSnabar(title: 'Congratulation', message: 'Your account has benn created! Verify email to continue');

  // Move to verify Email
  Get.to(() => VerifyEmailScreen(email: email.text.trim()));

  
  //Show the Success message
  
  //move the verify email screen


    } catch (e) {
       //some generic error to the user
    TLoaders.errorSnackBar(title:'on snap',message:e.toString());

    } finally {
      //Remove Loader
      TFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    }
  }
}

class TFullScreenLoader {

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!) ? TColors.dark : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        )
        )
        );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}


class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
  super.key,
  required this.text,
  required this.animation,
  this.showAction=false,
  this.actionText,
  this.onActionPressed,
  });

  final String text;
  final String  animation;
  final bool showAction;
  final String? actionText;

  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column (
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(animation, width: MediaQuery.of(context).size.width * 0.8), //0
        const SizedBox(height: TSizes.defaultSpace),
        Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ), // Text
          const SizedBox(height: TSizes.defaultSpace),
          showAction
          ? SizedBox(
            width: 250,
            child: OutlinedButton(
            onPressed: onActionPressed,
            style: OutlinedButton.styleFrom(backgroundColor:TColors.dark),
            child:Text(actionText!,
      style:Theme.of(context).textTheme.bodyMedium!.apply(color:TColors.light)
      ),//tcxt
    ),//outlinedButton
  )//sizedBox

  :const SizedBox(),
      ],
      ),
    );
  }
}