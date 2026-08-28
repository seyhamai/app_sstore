import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sstore_app/screen/cart_screen.dart';
import 'package:sstore_app/screen/notification_screen.dart';
import 'package:sstore_app/services/cart_service.dart';
import 'package:sstore_app/services/notification_service.dart';

class AppNavigationBar extends StatelessWidget
    implements PreferredSizeWidget {

  final String title;
  final String subtitle;

  const AppNavigationBar({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 2),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 4),

        ],
      ),

      actions: [
        AnimatedBuilder(
          animation: CartService.instance,
          builder: (context, child) => _IconWithBadge(
            count: CartService.instance.itemCount,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const CartScreen()),
              );
            },
            child: const Icon(CupertinoIcons.bag, color: Colors.black),
          ),
        ),

        AnimatedBuilder(
          animation: NotificationService.instance,
          builder: (context, child) => _IconWithBadge(
            count: NotificationService.instance.count,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const NotificationScreen()),
              );
            },
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.black,
            ),
          ),
        ),

        const SizedBox(width: 5),
      ],
    );
  }

}

class _IconWithBadge extends StatelessWidget {
  final int count;
  final VoidCallback onPressed;
  final Widget child;

  const _IconWithBadge({
    required this.count,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Badge(
        isLabelVisible: count > 0,
        label: Text(count > 99 ? '99+' : '$count'),
        backgroundColor: Colors.red,
        textColor: Colors.white,
        child: child,
      ),
    );
  }
}