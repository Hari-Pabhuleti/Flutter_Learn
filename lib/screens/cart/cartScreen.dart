import 'package:flutter/material.dart';
import 'package:fullstack/common/widgets/home_widgets/appbar.dart';
import 'package:fullstack/common/widgets/home_widgets/profuctcard.dart';
import 'package:fullstack/common/widgets/icons/t_circular_icon.dart';
import 'package:fullstack/common/widgets/layout/t_brandtext_icon.dart';
import 'package:fullstack/screens/cart/widgets/cart_items.dart';
import 'package:fullstack/screens/checkout/checkout.dart';
import 'package:fullstack/screens/home.dart';
import 'package:fullstack/utils/constants/colors.dart';
import 'package:fullstack/utils/constants/image_strings.dart';
import 'package:fullstack/utils/constants/sizes.dart';
import 'package:fullstack/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Cartscreen extends StatelessWidget {
  // ignore: use_super_parameters
  const Cartscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItems(),
        
      ),

      //Checkout Button
      bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: ElevatedButton(onPressed: () => Get.to(() => const CheckoutScreen()), child: const Text('Checkout \$256.0'))
      ),
    );
  }
}

class TProductQuantityWithAddRemoveButton extends StatelessWidget {
  const TProductQuantityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCIrcularIcon(
            icon: Iconsax.minus,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: THelperFunctions.isDarkMode(context)
                ? TColors.white
                : TColors.black,
            backgroundColor:
                THelperFunctions.isDarkMode(context)
                    ? TColors.darkerGrey
                    : TColors.light),
        SizedBox(width: TSizes.spaceBtwItems),
        Text('2',
            style: Theme.of(context).textTheme.titleSmall),
        SizedBox(width: TSizes.spaceBtwItems),
        TCIrcularIcon(
            icon: Iconsax.add,
            width: 32,
            height: 32,
            size: TSizes.md,
            color: TColors.white,
            backgroundColor: TColors.primary),
      ],
    );
  }
}

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        TRoundedImage(
          imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),

        const SizedBox(width: TSizes.spaceBtwItems),

        //Title, price and size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifyIcon(title: 'Nike'),
              const Flexible(
                  child: TProductTitleText(
                      title: 'Black Sport Shoes', maxLines: 1)),

              //Attributes
              Text.rich(TextSpan(
                children: [
                  TextSpan(
                      text: 'Color',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'Green',
                      style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(
                      text: 'Size',
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: 'UK 08',
                      style: Theme.of(context).textTheme.bodyLarge),
                ],
              ))
            ],
          ),
        ),
      ],
    );
  }
}
