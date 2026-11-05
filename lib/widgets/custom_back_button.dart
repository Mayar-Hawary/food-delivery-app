import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/custom_secondary_button.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final double height;
  final double width;

  const CustomBackButton({
    super.key,
    required this.height,
    required this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CustomSecondaryButton(
      height: height,
      width: width,
      onTap: onTap,
      iconData: Icons.chevron_left,
    );
  }
}
