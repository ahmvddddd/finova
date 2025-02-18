// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import 'containers/circular_container.dart';

class TSecondaryHeaderContainer extends StatelessWidget {
  const TSecondaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
        color: TColors.tetiary,
        padding: EdgeInsets.all(0),
        child: Stack(
    children: [
      Positioned(top: -150, right: -250, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
      Positioned(top: 100, right: -300, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
      child,
      
    ],
        )
    );
  }
}