import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fullstack/common/widgets/home_widgets/appbar.dart';
import 'package:fullstack/common/widgets/home_widgets/curved_edges.dart';
import 'package:fullstack/common/widgets/home_widgets/profuctcard.dart';
import 'package:fullstack/common/widgets/layout/gridview.dart';
import 'package:fullstack/common/widgets/layout/t_sectionheading.dart';
import 'package:fullstack/features/controllers/homecontroller/home_controller.dart';
import 'package:fullstack/screens/all_products/all_products.dart';
import 'package:fullstack/screens/cart/CartScreen.dart';
import 'package:fullstack/screens/subcategories/sub_categories.dart';
import 'package:fullstack/utils/constants/colors.dart';
import 'package:fullstack/utils/constants/image_strings.dart';
import 'package:fullstack/utils/constants/sizes.dart';
import 'package:fullstack/utils/constants/text_strings.dart';
import 'package:fullstack/utils/device/device_utility.dart';
import 'package:fullstack/utils/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen(
      {super.key,
      this.showBackground = true,
      this.showBorder = true,
      this.showActionButton = false,
      this.onTap});

  final bool showBackground, showBorder, showActionButton;
  final void Function()? onTap;
  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: TCustomCurvedEdges(),
              child: Container(
                color: TColors.primary,
                padding: const EdgeInsets.all(0),
                child: SizedBox(
                  height: 400,
                  child: Stack(
                    children: [
                      Positioned(
                          top: -105,
                          right: -250,
                          child: TCircukarContainer(
                              backgroundColor:
                                  TColors.textWhite.withOpacity(0.1))),
                      Positioned(
                          top: 100,
                          right: -300,
                          child: TCircukarContainer(
                              backgroundColor:
                                  TColors.textWhite.withOpacity(0.1))),
                      Column(
                        children: [
                          TAppBar(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(TTexts.homeAppbarTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(color: TColors.grey)),
                                Text(TTexts.homeAppbarSubTitle,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(color: TColors.grey)),
                              ],
                            ),
                            actions: [
                              Stack(
                                children: [
                                  IconButton(
                                      onPressed: () => Get.to(Cartscreen()),
                                      icon: Icon(
                                        Iconsax.shopping_bag,
                                        color: TColors.white,
                                      )),
                                  Positioned(
                                      right: 0,
                                      child: Container(
                                        width: 18,
                                        height: 18,
                                        decoration: BoxDecoration(
                                          color: TColors.black,
                                          borderRadius:
                                              BorderRadius.circular(100),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '2',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .apply(
                                                    color: TColors.white,
                                                    fontSizeFactor: 0.8),
                                          ),
                                        ),
                                      ))
                                ],
                              )
                            ],
                          ),

                          const SizedBox(height: TSizes.spaceBtwSections),

                          //Search Bar
                          GestureDetector(
                            onTap: onTap,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: TSizes.defaultSpace),
                              child: Container(
                                width: TDeviceUtils.getScreenWidth(context),
                                padding: const EdgeInsets.all(TSizes.md),
                                decoration: BoxDecoration(
                                    color: showBackground
                                        ? dark
                                            ? TColors.dark
                                            : TColors.light
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(
                                        TSizes.cardRadiusLg),
                                    border: showBorder
                                        ? Border.all(color: TColors.grey)
                                        : null),
                                child: Row(
                                  children: [
                                    Icon(Iconsax.search_normal,
                                        color: TColors.darkGrey),
                                    const SizedBox(width: TSizes.spaceBtwItems),
                                    Text('Search in Store',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall)
                                  ],
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: TSizes.spaceBtwSections),

                          //CAtegories
                          Padding(
                            padding: const EdgeInsets.only(
                                left: TSizes.defaultSpace),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Popular Categories",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall!
                                                .apply(color: Colors.black),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                        if (showActionButton)
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text('View All'))
                                      ],
                                    )
                                  ],
                                ),

                                const SizedBox(height: TSizes.spaceBtwItems),

                                //Categories
                                SizedBox(
                                  height: 80,
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: 6,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (_, index) {
                                        return GestureDetector(
                                          onTap: () => Get.to(() => const SubCategoriesScreen()),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                right: TSizes.spaceBtwItems),
                                            child: Column(
                                              children: [
                                                //Circular Icon
                                                Container(
                                                  width: 56,
                                                  height: 56,
                                                  padding: const EdgeInsets.all(
                                                      TSizes.sm),
                                                  decoration: BoxDecoration(
                                                      color: TColors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              100)),
                                                  child: const Center(
                                                    child: Image(
                                                        image: AssetImage(
                                                            TImages.shoeIcon),
                                                        fit: BoxFit.cover,
                                                        color: TColors.dark),
                                                  ),
                                                ),

                                                //Text
                                                const SizedBox(
                                                    height:
                                                        TSizes.spaceBtwItems /
                                                            2),
                                                SizedBox(
                                                    width: 55,
                                                    child: Text('Shoes',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .apply(
                                                                color: TColors
                                                                    .white),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis))
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

            //Body
            Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1,
                        onPageChanged: (index, _) =>
                            controller.updatePageIndicator(index)),
                    items: const [
                      TRoundedImage(imageUrl: TImages.promoBanner1),
                      TRoundedImage(imageUrl: TImages.promoBanner2),
                      TRoundedImage(imageUrl: TImages.promoBanner3),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Center(
                    child: Obx(
                      () => Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int i = 0; i < 3; i++)
                            TCircukarContainer(
                                width: 20,
                                height: 4,
                                margin: const EdgeInsets.only(right: 10),
                                backgroundColor:
                                    controller.carousalCurrentIndex.value == i
                                        ? TColors.primary
                                        : TColors.grey)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  //Heading
                  TSectionHeading(title: 'Popular Products', onPressed: () => Get.to(() => const AllProducts())),

                  //Popular Products
                  TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TCircukarContainer extends StatelessWidget {
  const TCircukarContainer({
    super.key,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding = 0,
    this.child,
    this.margin,
    this.backgroundColor = TColors.white,
  });

  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final Widget? child;
  final Color backgroundColor;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
    );
  }
}

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = TSizes.md,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
              fit: fit,
              image: isNetworkImage
                  ? NetworkImage(imageUrl)
                  : AssetImage(imageUrl) as ImageProvider),
        ),
      ),
    );
  }
}
