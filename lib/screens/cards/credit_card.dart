import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/sizes.dart';
import 'widgets/credit_card_back.dart';
import 'widgets/credit_card_front.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Credit Card',
          style: Theme.of(context).textTheme.headlineSmall,)
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.spaceBtwItems),
            child: Column(
              children: [
                FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: CreditCardFront(),
                  back: CreditCardBack(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




