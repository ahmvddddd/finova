import 'package:flutter/material.dart';

import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/credit_card_front.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Credit Card',
          style: Theme.of(context).textTheme.headlineSmall,)
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Responsive.screenWidth * 0.02),
            child: const Column(
              children: [
                SizedBox(height: TSizes.spaceBtwItems,),
                CreditCardFront(),
              ],
            ),
          ),
        ),
      ),
    );
    
  }
}