import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: Colors.white,
      indicatorColor: Colors.grey.shade200,

      destinations: const [
        NavigationDestination(
          icon: Icon(CupertinoIcons.house),
          selectedIcon: Icon(CupertinoIcons.house),
          label: "Home",
        ),

        NavigationDestination(
          icon: Icon(Icons.storefront_outlined),
          selectedIcon: Icon(Icons.storefront),
          label: "Shop",
        ),

        // NavigationDestination(
          
        //   icon: Icon(Icons.shopping_cart_outlined),
        //   selectedIcon: Icon(Icons.shopping_cart),
        //   label: "Cart",
        // ),

        NavigationDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite),
          label: "Favorites",
        ),

        NavigationDestination(
          icon: Icon(CupertinoIcons.person_crop_circle_fill),
          selectedIcon: Icon(CupertinoIcons.person_solid),
          label: "Account",
        ),
      ],
    );
  }
}