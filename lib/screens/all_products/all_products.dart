import 'package:flutter/material.dart';
import 'package:fullstack/common/widgets/home_widgets/appbar.dart';
import 'package:fullstack/screens/all_products/sortable/soratbel_products.dart';
import 'package:fullstack/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: Text('Popular Products'),showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TSortableProducts(),
        ),
      ),
    );
  }
}

