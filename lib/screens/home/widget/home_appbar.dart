import 'package:flutter/material.dart';
import '../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_function.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key,});
  

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    double screenHeight = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //avatar and greetings
        Row(
          children: [
            TRoundedContainer(
              width: screenHeight * 0.045,
              height: screenHeight * 0.045,
              radius: 100,
              backgroundColor: dark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.1),
              padding: const EdgeInsets.all(2),
              child: Image.asset(
                TImages.avatar,
                fit: BoxFit.contain,
                height: screenHeight * 0.40,
              ),
            ),

            const SizedBox(width: TSizes.xs,),
            Text('Hi, John Doe',
            style: Theme.of(context).textTheme.labelSmall,)
          ],
        ),
    
        //notifications
            Stack(children: [
              const Icon(
                Icons.notifications,
                size: TSizes.iconMd,
                color: Colors.white,
              ),
              Positioned(
                  right: -0.3,
                  child: Container(
                    width: 15,
                    height: 15,
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          100,
                        ),
                        color: Colors.red[900]),
                    child: Center(
                      child: Text(
                        '3',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(color: Colors.white, fontSize: 8),
                      ),
                    ),
                  ))
                  ],
            )
      ]
    );
  }
}
