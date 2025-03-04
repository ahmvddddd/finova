import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/custom_shapes/containers/button_container.dart';
import '../../common/widgets/layouts/list_view.dart';
import '../../common/widgets/texts/section_heading.dart';
import '../../models/recent_transfer_model.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/constants/sizes.dart';
import 'payment.dart';
import 'widgets/account_number.dart';
import 'widgets/bank_name.dart';
import 'widgets/recent_transfers.dart';
import 'widgets/transfer_box.dart';

class MoneyTransfer extends StatefulWidget {
  const MoneyTransfer({super.key});

  @override
  State<MoneyTransfer> createState() => _MoneyTransferState();
}

class _MoneyTransferState extends State<MoneyTransfer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Money Transfer',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          showBackArrow: false,
        ),
        bottomNavigationBar: 
                 ButtonContainer(
                  onPressed: () {
                    Get.to(() => const PaymentScreen());
                  },
                  text: 'Proceed',
                  shadowColor: Colors.transparent
                ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Responsive.padding),
            child: Column(
              children: [

                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const TSectionHeading(
                  title: 'Recent',
                  showActionButton: false,
                ),

                const SizedBox(
                  height: TSizes.sm,
                ),
                HomeListView(
                    sizedBoxHeight: Responsive.screenHeight * 0.16,
                    scrollDirection: Axis.horizontal,
                    seperatorBuilder: (context, index) =>
                         SizedBox(width: Responsive.screenWidth * 0.02),
                    itemCount: recentTransferList.length,
                    itemBuilder: (context, index) {
                      return RecentTransfers(
                        avatar: recentTransferList[index]["avatar"],
                        name: recentTransferList[index]["name"]
                      );
                    },
                    ),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const BankName(),

                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                const AccountNumber(),

                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const TransferBox(),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
