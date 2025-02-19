import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class BankName extends StatelessWidget {
  const BankName({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(TSizes.xs),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              // controller: _controller,
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
                  )),
            ),
          ),
          SizedBox(
              width: 80,
              child: Icon(
                Iconsax.bank,
                color: dark ? TColors.light : TColors.light,
                size: TSizes.iconSm,
              )),
        ],
      ),
    );
  }
}
