import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/responsive.dart';
import '../../../../utils/constants/sizes.dart';
import 'rounded_container.dart';

class ButtonContainer extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color backgroundColor;
  final Color shadowColor;
  const ButtonContainer({
    super.key,
    required this.text, 
    this.onPressed,
    this.backgroundColor = TColors.primary,
    required this.shadowColor
                // const ButtonContainer(
                //   text: 'Proceed',
                //   shadowColor: dark ?  TColors.white.withOpacity(0.1)
                // : TColors.black.withOpacity(0.1),
                // )
    
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(TSizes.spaceBtwItems),
        color: shadowColor,
        child: SizedBox(
          width: double.infinity,
          child: GestureDetector(
            onTap: onPressed,
            child: TRoundedContainer(
                          height: Responsive.buttonHeight,
                          padding: const EdgeInsets.all(TSizes.sm),
                          backgroundColor: backgroundColor,
                          child: Center(
                              child: Text(text,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: Colors.white))),
                        ),
          ),
        ),
      ),
    );
  }
}
