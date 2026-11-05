import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/pages/favorites_page.dart';
import 'package:food_delivery/pages/home_page.dart';
import 'package:food_delivery/pages/profile_page.dart';

class BottomNavbarPage extends StatefulWidget {
  const BottomNavbarPage({super.key});

  @override
  State<BottomNavbarPage> createState() => _BottomNavbarPageState();
}

class _BottomNavbarPageState extends State<BottomNavbarPage> {
  int _selectedIndex = 0;

  static const _items = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
    BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _getBody(int index) {
    switch (index) {
      case 1:
        return const FavoritesPage();
      case 2:
        return const ProfilePage();
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isIOS = defaultTargetPlatform == TargetPlatform.iOS;

    final PreferredSizeWidget appBar = isIOS
        ? CupertinoNavigationBar(
            middle: const Text('Foodak'),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          )
        : AppBar(title: const Text('Foodak'));

    final Widget bottomNavBar = isIOS
        ? CupertinoTabBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: _items,
          )
        : BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: _items,
          );

    return Scaffold(
      appBar: appBar,
      body: SafeArea(child: _getBody(_selectedIndex)),
      bottomNavigationBar: bottomNavBar,
    );
  }
}
