import 'package:flutter/material.dart';
import 'package:fullstack/common/widgets/home_widgets/profuctcard.dart';
import 'package:fullstack/common/widgets/layout/gridview.dart';
import 'package:fullstack/common/widgets/layout/t_sectionheading.dart';
import 'package:fullstack/screens/store.dart';
import 'package:fullstack/utils/constants/image_strings.dart';
import 'package:fullstack/utils/constants/sizes.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //Brands
            const TBrandShowcase(images: [TImages.productImage1, TImages.productImage3,TImages.productImage2]),
            const TBrandShowcase(images: [TImages.productImage1, TImages.productImage3,TImages.productImage2]),
            const SizedBox(height: TSizes.spaceBtwItems),

            ///Products
            TSectionHeading(title: 'You might like',  onPressed: () {}),
            const SizedBox(height: TSizes.spaceBtwItems),

            TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),)
      ],
    );
  }
}