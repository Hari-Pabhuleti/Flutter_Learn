import 'package:flutter/material.dart';
import 'package:fullstack/common/widgets/home_widgets/appbar.dart';
import 'package:fullstack/screens/all_products/sortable/soratbel_products.dart';
import 'package:fullstack/screens/store.dart';
import 'package:fullstack/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(title: Text('Nike'), showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //Brand Detail
            TBrandCard(showBorder: true),
            SizedBox(height: TSizes.spaceBtwSections),

            TSortableProducts(),
          ],
        ),),
      ),
    );
  }
}