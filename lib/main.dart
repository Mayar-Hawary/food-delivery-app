import 'package:flutter/material.dart';
import 'package:food_delivery/pages/bottom_navbar.dart';
import 'package:food_delivery/pages/food_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = ColorScheme.fromSeed(seedColor: Colors.deepPurple);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Foodak - Food Delivery',
      theme: ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[100],
          elevation: 0,
          foregroundColor: Colors.black,
        ),
        dividerTheme: const DividerThemeData(
          thickness: 3,
          indent: 30,
          endIndent: 30,
          color: Color.fromRGBO(201, 195, 195, 0.816),
        ),
        listTileTheme: ListTileThemeData(iconColor: colorScheme.primary),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
      routes: {
        '/': (context) => const BottomNavbarPage(),
        FoodDetailsPage.routeName: (context) => const FoodDetailsPage(),
      },
    );
  }
}
