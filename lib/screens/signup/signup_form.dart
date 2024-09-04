import 'package:flutter/material.dart';
import 'package:fullstack/features/controllers/signup/signup_controller.dart';
import 'package:fullstack/screens/signup/verify_email.dart';
import 'package:fullstack/utils/constants/colors.dart';
import 'package:fullstack/utils/constants/sizes.dart';
import 'package:fullstack/utils/constants/text_strings.dart';
import 'package:fullstack/utils/helpers/helper_functions.dart';
import 'package:fullstack/utils/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) => TValidator.validateEmptyText('First name', value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.firstName,
                  prefixIcon: Icon(Iconsax.user)),
            )),
            SizedBox(width: TSizes.spaceBtwInputFields),
            Expanded(
              child: TextFormField(
                controller: controller.lastName,
                validator: (value) => TValidator.validateEmptyText('Last name', value),
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
    
        SizedBox(height: TSizes.spaceBtwInputFields),
    
        ///username
        TextFormField(
          controller: controller.username,
          validator: (value) => TValidator.validateEmptyText('Username', value),
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit)),
        ),
    
        SizedBox(height: TSizes.spaceBtwInputFields),
    
        //Email
        TextFormField(
          controller: controller.email,
          validator: (value) => TValidator.validateEmail(value),
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct)),
        ),
    
        SizedBox(height: TSizes.spaceBtwInputFields),
    
        //phoneNumber
        TextFormField(
          controller: controller.phoneNumber,
          validator: (value) => TValidator.validatePhoneNumber(value),
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call)),
        ),
        SizedBox(height: TSizes.spaceBtwInputFields),
    
        //password
        TextFormField(
          controller: controller.password,
          validator: (value) => TValidator.validatePassword(value),
          decoration: const InputDecoration(
            prefixIcon: Icon(Iconsax.password_check),
            labelText: TTexts.password,
            suffixIcon: Icon(Iconsax.eye_slash),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
    
        //T&C CheckBox
        Row(
          children: [
            SizedBox(width: 24, height: 24, child: Checkbox(value: true, onChanged: (value) {})),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text.rich(
              TextSpan(children: [
                TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: '${TTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white: TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white: TColors.primary,
                )),
                TextSpan(text: '${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text: '${TTexts.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: dark ? TColors.white: TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: dark ? TColors.white: TColors.primary,
                )),
              ]),
            ),
          ],
        ),
    
        //signup Button
        SizedBox(width: double.infinity,
        child: ElevatedButton(
        onPressed: () => controller.signup(),
        child: const Text(TTexts.createAccount))),
      ],
    ),
    );
  }
}
