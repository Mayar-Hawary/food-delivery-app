import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/custom_secondary_button.dart';

class FavoriteButton extends StatefulWidget {
  final int foodIndex;
  final double height;
  final double width;
  final List<FoodItem> food;

  const FavoriteButton({
    super.key,
    required this.foodIndex,
    required this.height,
    required this.width,
    required this.food,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    final item = widget.food[widget.foodIndex];
    return CustomSecondaryButton(
      height: widget.height,
      width: widget.width,
      onTap: () => setState(() {
        widget.food[widget.foodIndex] = item.copyWith(
          isFavorite: !item.isFavorite,
        );
      }),
      iconData: item.isFavorite ? Icons.favorite : Icons.favorite_border,
    );
  }
}
