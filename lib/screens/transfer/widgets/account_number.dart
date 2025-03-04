// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class AccountNumber extends StatefulWidget {
  const AccountNumber({super.key});

  @override
  State<AccountNumber> createState() => _AccountNumberState();
}

class _AccountNumberState extends State<AccountNumber> {
  final TextEditingController _controller = TextEditingController();
  final Map<String, String> beneficiaries = {
    "Ann Smith": "1234567890",
    "Ben Franco": "0987654321",
    "Janette Doe": "1122334455",
    "John Doe": "5566778899",
    "Najma Ali": "6677889900",
  };
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
          borderColor: dark
              ? Colors.white.withOpacity(0.1)
              : Colors.black.withOpacity(0.1),
          padding: const EdgeInsets.all(TSizes.xs),
          child: Row(
            children: [
              Flexible(
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'Enter Account Number',
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
                    Iconsax.user,
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
              children: beneficiaries.entries.map((entry) {
                return ListTile(
                  title: Text(entry.key),
                  onTap: () {
                    setState(() {
                      _controller.text = entry.value;
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
