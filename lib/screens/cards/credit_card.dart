import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../common/widgets/layouts/list_view.dart';
import '../../common/widgets/texts/section_heading.dart';
import '../../models/transaction_history_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
import '../home/widget/transaction_history.dart';
import 'widgets/credit_card_back.dart';
import 'widgets/credit_card_buttons.dart';
import 'widgets/credit_card_front.dart';

class CreditCardPage extends StatelessWidget {
  const CreditCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          title: Text('Credit Card',
          style: Theme.of(context).textTheme.headlineSmall,)
        ),
        body:  SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.spaceBtwItems),
            child: Column(
              children: [
                const FlipCard(
                  direction: FlipDirection.HORIZONTAL,
                  front: CreditCardFront(),
                  back: CreditCardBack(),
                ),

                const SizedBox(height: TSizes.spaceBtwSections),
                const CreditCardButtons(),

                const SizedBox(height: TSizes.spaceBtwItems),
                const TSectionHeading(
                  title: 'Card Transaction History',
                ),
                const SizedBox(height: TSizes.sm,),
                TRoundedContainer(
                    backgroundColor: dark ? TColors.dark.withOpacity(0.5) : TColors.light.withOpacity(0.5),
                    padding: const EdgeInsets.all(TSizes.sm),
                    radius: TSizes.cardRadiusSm,
                    child: HomeListView(
                      scrollDirection: Axis.vertical,
                      scrollPhysics: const NeverScrollableScrollPhysics(),
                      seperatorBuilder: (context, index) =>
                          const SizedBox(height: TSizes.sm),
                      itemCount: transactionHistoryList.length,
                      itemBuilder: (context, index) {
                        return TransactionHistory(
                          icon: transactionHistoryList[index]["icon"],
                          color: transactionHistoryList[index]["color"],
                          name: transactionHistoryList[index]["name"],
                          transactionType: transactionHistoryList[index]["transaction_type"],
                          amount: transactionHistoryList[index]["amount"],
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




