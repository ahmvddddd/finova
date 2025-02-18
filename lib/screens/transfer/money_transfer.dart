import 'package:flutter/material.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/constants/sizes.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Responsive.screenWidth * 0.02),
            child: const Column(
              children: [
                SizedBox(
                  height: TSizes.sm,
                ),
                TransferBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
