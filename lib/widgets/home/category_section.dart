
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../models/category_model.dart';

class CategorySection extends StatelessWidget {
  final List<CategoryModel> categories;

  const CategorySection({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITLE
        const Text(
          "Categories",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        /// CATEGORY LIST
        SizedBox(
  height: 100,
  child: ScrollConfiguration(
    behavior: const MaterialScrollBehavior().copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    ),
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];

        return _CategoryItem(
          category: category,
        );
      },
    ),
  ),
),
      ],
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final CategoryModel category;

  const _CategoryItem({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75,

      margin: const EdgeInsets.only(
        right: 15,
      ),

      child: Column(
        children: [
          /// ICON
          Container(
            width: 50,
            height: 50,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),

            child: Icon(
              _getIcon(category.icon),
              color: Colors.black,
              size: 24,
            ),
          ),

          const SizedBox(height: 8),

          /// NAME
          Text(
            category.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,

            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIcon(String icon) {
    switch (icon) {
      case "directions_run":
        return Icons.directions_run;

      case "sports":
        return Icons.sports;

      case "sports_soccer":
        return Icons.sports_soccer;

      case "sports_basketball":
        return Icons.sports_basketball;

      case "checkroom":
        return Icons.checkroom;

      case "flip_flop":
        return Icons.flip_camera_android;

      case "grid":
      default:
        return Icons.grid_view;
    }
  }
}

