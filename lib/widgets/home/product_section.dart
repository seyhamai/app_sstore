import 'package:flutter/material.dart';
import '../../models/product_model.dart';
import 'package:flutter/gestures.dart';
import '../product_card.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final List<ProductModel> products;
  final VoidCallback? onSeeAll;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
    this.onSeeAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        /// TITLE + SEE ALL
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),

            TextButton(
              onPressed: onSeeAll,
              child: const Text(
                "See all",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.orange,
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 8),

       SizedBox(
        height: 270,
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

            itemCount: products.length,

            itemBuilder: (context, index) {
              return ProductCard(
                product: products[index],
              );
            },
          ),
        ),
      ),
      ],
    );
  }
}
