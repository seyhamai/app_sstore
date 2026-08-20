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
    return TooltipVisibility(
      visible: false,

      child: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: onTap,

        backgroundColor: Colors.white,
        indicatorColor: Colors.white54,

        destinations: const [
          NavigationDestination(
            icon: Icon(CupertinoIcons.house),
            selectedIcon: Icon(CupertinoIcons.house_fill),
            label: "Home",
          ),

          NavigationDestination(
            icon: Icon(CupertinoIcons.shopping_cart),
            selectedIcon: Icon(CupertinoIcons.shopping_cart),
            label: "Shop",
          ),

          NavigationDestination(
            icon: Icon(CupertinoIcons.cart),
            selectedIcon: Icon(CupertinoIcons.cart_fill),
            label: "Cart",
          ),

          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            selectedIcon: Icon(Icons.favorite),
            label: "Favorites",
          ),

          NavigationDestination(
            icon: Icon(CupertinoIcons.person_crop_circle_fill),
            selectedIcon: Icon(CupertinoIcons.person_crop_circle_fill),
            label: "Me",
          ),
        ],
      ),
    );
  }
}
