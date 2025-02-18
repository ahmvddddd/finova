import 'package:flutter/material.dart';
import '../../common/widgets/layouts/list_view.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helper_function.dart';
import 'widget/account_balance.dart';
import 'widget/expenses.dart';
import 'widget/home_appbar.dart';
import 'widget/quick_transactions.dart';
import 'widget/quick_utilities.dart';

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
              padding: EdgeInsets.all(Responsive.screenWidth * 0.02),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
