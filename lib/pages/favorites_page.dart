import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/utils/app_assets.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Widget _buildFavButton(
    List<FoodItem> favoriteFood,
    int index,
    Size size,
    bool isLandscape,
  ) {
    return IconButton(
      onPressed: () {
        final targetedItem = favoriteFood[index];
        final targetedIndex = food.indexOf(targetedItem);
        setState(() {
          food[targetedIndex] = food[targetedIndex].copyWith(
            isFavorite: !food[targetedIndex].isFavorite,
          );
        });
      },
      icon: const Icon(Icons.favorite),
      color: Theme.of(context).colorScheme.primary,
      iconSize: isLandscape ? size.height * 0.1 : size.height * 0.035,
    );
  }

  Widget _emptyFavState(bool isLandscape, Size size) {
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(height: isLandscape ? 20 : 90),
            Padding(
              padding: EdgeInsets.all(isLandscape ? 10.0 : 30.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.0),
                child: Image.asset(
                  AppAssets.emptyState,
                  height: isLandscape ? size.height * 0.4 : size.height * 0.3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 1),
            Text(
              'No favorite items found!',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final favoriteFood = food.where((item) => item.isFavorite).toList();
    if (favoriteFood.isEmpty) {
      return _emptyFavState(isLandscape, size);
    }
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView.builder(
        itemCount: favoriteFood.length,
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            final targetedIndex = food.indexOf(favoriteFood[index]);
            Navigator.of(context)
                .pushNamed(
                  FoodDetailsPage.routeName,
                  arguments: FoodDetailsArgs(foodIndex: targetedIndex),
                )
                .then((_) {
                  if (mounted) setState(() {});
                });
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Image.asset(
                    favoriteFood[index].imgUrl,
                    height: isLandscape
                        ? size.height * 0.2
                        : size.height * 0.09,
                    width: size.width * 0.2,
                    fit: BoxFit.contain,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                favoriteFood[index].name,
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Text(
                            '\$${favoriteFood[index].price.toStringAsFixed(2)}',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _buildFavButton(favoriteFood, index, size, isLandscape),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
