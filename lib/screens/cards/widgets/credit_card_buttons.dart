import 'package:flutter/material.dart';

import '../../../common/widgets/layouts/grid_layout.dart';
import '../../../models/credit_card_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/responsive.dart';
import '../../../utils/constants/sizes.dart';

class CreditCardButtons extends StatelessWidget {
  const CreditCardButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
      itemCount: creditCardList.length,
      crossAxisCount: 4,
      mainAxisExtent: Responsive.screenHeight * 0.10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            IconButton(
              onPressed: () {},
              style: IconButton.styleFrom(backgroundColor: TColors.primary,),
              icon: Icon(creditCardList[index]["icon"],
              color: Colors.white,),
            ),
            const SizedBox(height: TSizes.sm + 4),
            SizedBox(
              width: Responsive.screenWidth * 0.30,
              child: Text(creditCardList[index]["text"],
              style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 8),
              textAlign: TextAlign.center,
              softWrap: true,),
            )
          ],
        );
      }
    );
  }
}