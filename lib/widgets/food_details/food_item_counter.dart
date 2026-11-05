import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';

class FoodItemCounter extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const FoodItemCounter({super.key, required this.onChanged});

  @override
  State<FoodItemCounter> createState() => _FoodItemCounterState();
}

class _FoodItemCounterState extends State<FoodItemCounter> {
  int counter = 1;

  void incrementCounter() {
    setState(() => counter++);
    widget.onChanged(counter);
  }

  void decrementCounter() {
    if (counter > 1) {
      setState(() => counter--);
      widget.onChanged(counter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.softGrey,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: decrementCounter,
          ),
          Text('$counter', style: Theme.of(context).textTheme.titleMedium),
          IconButton(icon: const Icon(Icons.add), onPressed: incrementCounter),
        ],
      ),
    );
  }
}
