import 'package:flutter/material.dart';
import 'package:fullstack/screens/cart/CartScreen.dart';
import 'package:fullstack/screens/product_detail.dart';
import 'package:fullstack/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
          shrinkWrap: true,
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 2,
          itemBuilder: (_, index) => Column(
            children: [

              //Cart Item
              TCartItem(),
              if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),

              //Add Remove button Row with total price
              if(showAddRemoveButtons)
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //Extra Space
                      SizedBox(width: 70),
                  //Add Remove Button
                  TProductQuantityWithAddRemoveButton(),
                  
                    ],
                  ),

                  //Product Total Price
                  TProductPriceText(price: '256'),
                ],
              ),
            ],
          ),
        );
  }
}