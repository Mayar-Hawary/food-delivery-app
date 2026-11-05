import 'package:flutter/material.dart';

class CustomSecondaryButton extends StatelessWidget {
  final double height;
  final double width;
  final IconData iconData;
  final VoidCallback? onTap;

  const CustomSecondaryButton({
    super.key,
    required this.height,
    required this.width,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(8.0),
        onTap: onTap,
        child: SizedBox(
          height: height,
          width: width,
          child: Icon(iconData, color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
