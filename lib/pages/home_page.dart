import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/food_details_page.dart';
import 'package:food_delivery/ui_models/food_details_args.dart';
import 'package:food_delivery/utils/app_assets.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandscape = size.width > size.height;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: AspectRatio(
                aspectRatio: 5000 / 2700,
                child: Image.asset(
                  AppAssets.classicBurgerImage,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: food.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandscape ? 3 : 2,
                childAspectRatio: isLandscape ? 1.4 : 1,
                mainAxisSpacing: size.height * 0.02,
                crossAxisSpacing: size.height * 0.02,
              ),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(
                        FoodDetailsPage.routeName,
                        arguments: FoodDetailsArgs(foodIndex: index),
                      )
                      // Refresh the home page when coming back from details
                      .then((_) {
                        if (mounted) setState(() {});
                      });
                },
                child: FoodGridItem(foodIndex: index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
