import 'package:flutter/material.dart';
import '../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../common/widgets/layouts/list_view.dart';
import '../../common/widgets/texts/section_heading.dart';
import '../../models/transaction_history_model.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
import 'widget/account_balance.dart';
import 'widget/expenses.dart';
import 'widget/home_appbar.dart';
import 'widget/quick_transactions.dart';
import 'widget/quick_utilities.dart';
import 'widget/transaction_history.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: Responsive.screenHeight * 0.08,
                backgroundColor: dark ? Colors.black : Colors.white,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.sm),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      HomeAppBar(),
                    ],
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Responsive.padding),
              child: Column(
                children: [
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  HomeListView(
                    sizedBoxHeight: Responsive.screenHeight * 0.14,
                    scrollDirection: Axis.horizontal,
                    seperatorBuilder: (context, index) =>
                         SizedBox(width: Responsive.screenWidth * 0.02),
                    itemCount: 2,
                    itemBuilder: (context, index) => const AccountBalance(),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const QuickTransactions(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const Expenses(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const QuickUtilities(),

                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'Transaction History',
                  ),
                  const SizedBox(
                    height: TSizes.sm,
                  ),
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
      ),
    );
  }
}
