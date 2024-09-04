import 'package:flutter/material.dart';
import 'package:fullstack/common/widgets/home_widgets/appbar.dart';
import 'package:fullstack/common/widgets/layout/t_circularimage.dart';
import 'package:fullstack/common/widgets/layout/t_curvedEdgewidget.dart';
import 'package:fullstack/common/widgets/layout/t_sectionheading.dart';
import 'package:fullstack/screens/address/address.dart';
import 'package:fullstack/screens/home.dart';
import 'package:fullstack/screens/order/order_screen.dart';
import 'package:fullstack/screens/profile/profilescreen.dart';
import 'package:fullstack/utils/constants/colors.dart';
import 'package:fullstack/utils/constants/image_strings.dart';
import 'package:fullstack/utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar
                  TAppBar(
                      title: Text('Account',
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .apply(color: TColors.white))),

                  // User Profile Card
                  ListTile(
                      leading: const TCircularImage(
                          image: TImages.user,
                          width: 50,
                          height: 50,
                          padding: 0),
                      title: Text('Rukesh Reddy',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.white)),
                      subtitle: Text('Rukesh Reddy',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.white)),
                      trailing: IconButton(
                          onPressed: () => Get.to(()  => const ProfileScreen()),
                          icon: const Icon(Iconsax.edit),
                          color: TColors.white)),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            //Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //Accoun Settings
                  const TSectionHeading(
                      title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTitle(
                      icon: Iconsax.safe_home,
                      title: 'My Addresses',
                      subTitle: 'Set Shopping delivery address',
                      onTap: () => Get.to(() => const UserAddressScreen())),
                  TSettingsMenuTitle(
                      icon: Iconsax.shopping_cart,
                      title: 'My Cart',
                      subTitle: 'Add remove products and move to checkout'),
                  TSettingsMenuTitle(
                      icon: Iconsax.bag_tick,
                      title: 'My Orders',
                      subTitle: 'In-progrss and Completed Orders',
                      onTap: () => Get.to(() => const OrderScreen())),
                  TSettingsMenuTitle(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subTitle: 'Withdraw balance to registre bank account'),
                  TSettingsMenuTitle(
                      icon: Iconsax.discount_shape,
                      title: 'My Coupons',
                      subTitle: 'List of all the discounted coupons'),
                  TSettingsMenuTitle(
                      icon: Iconsax.notification,
                      title: 'Notifications',
                      subTitle: 'Set Shopping delivery address'),
                  TSettingsMenuTitle(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subTitle: 'Manage data usage and connection'),

                  //App Settings
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTitle(
                      icon: Iconsax.document_upload,
                      title: 'Load Data',
                      subTitle: 'Upload data to your Cloud Firebase'),

                  TSettingsMenuTitle(
                      icon: Iconsax.location,
                      title: 'Geolocation',
                      subTitle: 'Set recommendation based on location',
                      trailing: Switch(value: true, onChanged: (value) {})),

                  TSettingsMenuTitle(
                      icon: Iconsax.security_user,
                      title: 'Safe Moode',
                      subTitle: 'Search result is safe for all ages',
                      trailing: Switch(value: false, onChanged: (value) {})),

                  TSettingsMenuTitle(
                      icon: Iconsax.image,
                      title: 'HD Image Quality',
                      subTitle: 'Set Image Quality to be seen',
                      trailing: Switch(value: false, onChanged: (value) {})),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TSettingsMenuTitle extends StatelessWidget {
  const TSettingsMenuTitle(
      {super.key,
      required this.icon,
      required this.title,
      required this.subTitle,
      this.trailing,
      this.onTap});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28, color: TColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(title, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTap,
    );
  }
}

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvededgewidget(
        child: Container(
        color: TColors.primary,
        child: Stack(
          children: [
            Positioned(
                top: -150,
                right: -250,
                child: TCircukarContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: TCircukarContainer(
                    backgroundColor: TColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
