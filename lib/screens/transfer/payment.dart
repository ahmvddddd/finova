import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/widgets/appbar/appbar.dart';
import '../../common/widgets/custom_shapes/containers/button_container.dart';
import '../../navigation_menu.dart';
import '../../utils/constants/colors.dart';
import '../../utils/constants/responsive.dart';
import '../../utils/constants/sizes.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final List<String> _pin = ["", "", "", ""]; // Stores each digit of the PIN
  int _currentIndex = 0; // Tracks the currently active box
  bool _isKeyboardVisible = false; // Controls keyboard visibility

  // Handle number input
  void _onKeyPressed(String value) {
    if (_currentIndex < 4) {
      setState(() {
        _pin[_currentIndex] = value;
        _currentIndex++;
      });
    }
  }

  // Handle delete button
  void _onDeletePressed() {
    if (_currentIndex > 0) {
      setState(() {
        _currentIndex--;
        _pin[_currentIndex] = "";
      });
    }
  }

  // Show or hide the custom keyboard
  void _toggleKeyboard(bool show) {
    setState(() {
      _isKeyboardVisible = show;
    });
  }

  // Submit PIN after validation
  void _submitPin() {
    String pinCode = _pin.join();
    if (pinCode.length == 4) {
      Get.snackbar("Success", "");
      Get.to(()=> const NavigationMenu());
      // Implement navigation or API calls here if needed
    } else {
      Get.snackbar("Incorrect PIN", "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Hide custom keyboard on outside tap
        _toggleKeyboard(false);
      },
      child: Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
        ),
        bottomNavigationBar: ButtonContainer(
          shadowColor: Colors.transparent,
          text: 'Pay',
          onPressed: _submitPin,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Text(
                'Enter your PIN',
                style: Theme.of(context).textTheme.labelMedium
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return GestureDetector(
                    onTap: () {
                      // Show keyboard when tapping on any box
                      _toggleKeyboard(true);
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                    child: Container(
                      width: Responsive.tabIconHeight,
                      height: Responsive.tabIconHeight,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: TColors.primary.withOpacity(0.8)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        _pin[index]
                        .isEmpty
                              ? "-"
                              : ".",
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(color: TColors.primary, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: TSizes.spaceBtwSections + 8),
              if (_isKeyboardVisible) _buildKeypad(),
              const SizedBox(height: TSizes.sm),
              
            ],
          ),
        ),
      ),
    );
  }

  // Custom numeric keypad widget
  Widget _buildKeypad() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: 12,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisExtent: Responsive.screenWidth * 0.25,
      crossAxisCount: 3
      ),
      itemBuilder: (context, index) {
        String buttonText;
        if (index < 9) {
          buttonText = (index + 1).toString();
        } else if (index == 9) {
          buttonText = ""; // Empty cell
        } else if (index == 10) {
          buttonText = "0";
        } else {
          buttonText = "<"; // Delete button
        }

        return GestureDetector(
          onTap: () {
            if (buttonText == "<") {
              _onDeletePressed();
            } else if (buttonText.isNotEmpty) {
              _onKeyPressed(buttonText);
            }
          },
          child: Container(
            margin: const EdgeInsets.all(8.0),
            height: Responsive.screenWidth * 0.25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: buttonText == "<" ? Colors.red[900] : TColors.primary.withOpacity(0.8),
            ),
            child: Center(
              child: Text(
                buttonText,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: buttonText == "<" ? Colors.grey : Colors.white)
              ),
            ),
          ),
        );
      },
    );
  }
}