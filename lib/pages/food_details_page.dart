import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/widgets/favorite_button.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/widgets/custom_back_button.dart';
import 'package:food_delivery/widgets/food_details/food_item_counter.dart';
import 'package:food_delivery/widgets/food_details/property_item.dart';

class FoodDetailsPage extends StatefulWidget {
  const FoodDetailsPage({super.key});

  static const String routeName = '/food-details';

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final FoodDetailsArgs foodArgs =
        ModalRoute.of(context)!.settings.arguments as FoodDetailsArgs;
    final foodIndex = foodArgs.foodIndex;
    final sizes = food[foodIndex].sizes;
    final buttonSize = size.shortestSide * 0.1;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomBackButton(
                        onTap: () => Navigator.of(context).pop(),
                        height: buttonSize,
                        width: buttonSize,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FavoriteButton(
                          foodIndex: foodIndex,
                          food: food,
                          height: buttonSize,
                          width: buttonSize,
                        ),
                      ),
                    ],
                    expandedHeight: size.height * 0.4,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: DecoratedBox(
                        decoration: BoxDecoration(color: AppColors.softGrey),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 24.0),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: SizedBox(
                              width: size.width * 0.8,
                              height: size.height * 0.30,
                              child: Image.asset(
                                food[foodIndex].imgUrl,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text(
                                  food[foodIndex].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall
                                      ?.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(width: 12.0),
                              FoodItemCounter(
                                onChanged: (value) =>
                                    setState(() => quantity = value),
                              ),
                            ],
                          ),
                          const SizedBox(height: 32.0),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                for (int i = 0; i < sizes.length; i++) ...[
                                  if (i > 0)
                                    const VerticalDivider(
                                      color: Colors.grey,
                                      thickness: 2.0,
                                    ),
                                  Expanded(
                                    child: Column(
                                      children: [
                                        PropertyItem(
                                          title: 'Size',
                                          value: sizes[i].label,
                                        ),
                                        PropertyItem(
                                          title: 'Cooking',
                                          value: sizes[i].cookingTime,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          const SizedBox(height: 32.0),
                          SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Description',
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(color: Colors.grey[700]),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  food[foodIndex].description ??
                                      'No description available.',
                                  style: Theme.of(context).textTheme.titleSmall
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 32.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Price & checkout button
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                bottom: 16.0,
              ),
              child: Row(
                children: [
                  Text(
                    '\$${(food[foodIndex].price * quantity).toStringAsFixed(2)}',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 35.0),
                  Expanded(
                    child: SizedBox(
                      height: 48.0,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Order placed: $quantity x ${food[foodIndex].name}',
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(
                            context,
                          ).colorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        child: const Text('Checkout'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
