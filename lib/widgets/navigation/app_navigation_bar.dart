import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
        IconButton(
          onPressed: () {
            // TODO: Cart
          },
          icon: const Icon(
            CupertinoIcons.bag,
            color: Colors.black,
          ),
        ),

        IconButton(
          onPressed: () {
            // TODO: Notifications
          },
          icon: const Icon(
            Icons.notifications_outlined,
            color: Colors.black,
          ),
        ),

        const SizedBox(width: 5),
      ],
    );
  }
}