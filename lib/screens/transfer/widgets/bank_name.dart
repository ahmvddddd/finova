import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../models/transaction_history_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class BankName extends StatefulWidget {
  const BankName({super.key});

  @override
  BankNameState createState() => BankNameState();
}

class BankNameState extends State<BankName> {
  final TextEditingController _controller = TextEditingController();
  bool _showDropdown = false;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TRoundedContainer(
          showBorder: true,
          backgroundColor: Colors.transparent,
          borderColor: dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
          padding: const EdgeInsets.all(TSizes.xs),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _controller,
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  decoration: InputDecoration(
                    hintText: 'Search Bank',
                    hintStyle: Theme.of(context).textTheme.labelSmall,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showDropdown = !_showDropdown;
                  });
                },
                child: SizedBox(
                  width: 50,
                  child: Icon(
                    Iconsax.bank,
                    color: dark ? TColors.light : TColors.light,
                    size: TSizes.iconSm,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (_showDropdown)
          Container(
            decoration: BoxDecoration(
              color: dark ? Colors.grey[900] : Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                 BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              children: banks.map((bank) {
                return ListTile(
                  title: Text(bank),
                  onTap: () {
                    setState(() {
                      _controller.text = bank;
                      _showDropdown = false;
                    });
                  },
                );
              }).toList(),
            ),
          ),
      ],
    );
  }
}

