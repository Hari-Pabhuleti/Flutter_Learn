import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fullstack/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoaders extends StatelessWidget {
  const TLoaders({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }


  static successSnabar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,message,
      isDismissible: true);
  }

  static warningSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: Colors.orange,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2, color: TColors.white,));
  }

  static errorSnackBar({required title, message = ''}) {
    Get.snackbar(title, message,
    isDismissible: true,
    shouldIconPulse: true,
    colorText: TColors.white,
    backgroundColor: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.all(20),
    icon: const Icon(Iconsax.warning_2, color: TColors.white,));
  }
}