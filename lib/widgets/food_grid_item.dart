import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/widgets/favorite_button.dart';

class FoodGridItem extends StatelessWidget {
  final int foodIndex;
  const FoodGridItem({super.key, required this.foodIndex});

  @override
  Widget build(BuildContext context) {
    final item = food[foodIndex];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Padding(
                        padding: EdgeInsets.all(constraints.maxWidth * 0.06),
                        child: Image.asset(
                          item.imgUrl,
                          fit: BoxFit.contain,
                          alignment: Alignment.center,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: FavoriteButton(
                        foodIndex: foodIndex,
                        food: food,
                        height: constraints.maxHeight * 0.2,
                        width: constraints.maxWidth * 0.2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: constraints.maxWidth,
                height: constraints.maxHeight * 0.17,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    item.name,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(height: constraints.maxHeight * 0.02),
              SizedBox(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
