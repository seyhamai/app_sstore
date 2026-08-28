import 'package:flutter/material.dart';
import 'package:sstore_app/widgets/home/home_search.dart';
import 'package:sstore_app/widgets/navigation/app_navigation_bar.dart';
import 'package:sstore_app/models/product_model.dart';

import '../data/fake_data.dart';
import '../widgets/product_card.dart';

class ShopScreen extends StatelessWidget {
  final String searchQuery;
  final List<ProductModel>? products;

  const ShopScreen({
    super.key,
    this.searchQuery = '',
    this.products,
  });

  @override
  Widget build(BuildContext context) {
    final availableProducts = products ?? FakeData.products;
    final query = searchQuery.trim().toLowerCase();
    final filteredProducts = query.isEmpty
      ? availableProducts
      : availableProducts
        .where((product) => product.name.toLowerCase().contains(query))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),

      appBar: const AppNavigationBar(
        title: "Shop",
        subtitle: "Find your best product",
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// SEARCH + CATEGORIES
            Container(
              width: double.infinity,
              color: Colors.white,

              padding: const EdgeInsets.fromLTRB(
                16,
                10,
                16,
                15,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  /// SEARCH
                  HomeSearch(),

                  const SizedBox(height: 20),

                  /// CATEGORY TITLE
                  const Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  /// CATEGORIES
                  SizedBox(
                    height: 45,

                    child: ListView(
                      scrollDirection:
                          Axis.horizontal,

                      children: const [
                        _CategoryButton(
                          title: "All",
                          selected: true,
                        ),

                        _CategoryButton(
                          title: "Men",
                        ),

                        _CategoryButton(
                          title: "Women",
                        ),

                        _CategoryButton(
                          title: "Kids",
                        ),

                        _CategoryButton(
                          title: "Sports",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// SPACE BETWEEN CATEGORY AND PRODUCTS
            const SizedBox(height: 20),

            /// PRODUCTS
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  /// PRODUCT TITLE
                  Text(
                    query.isEmpty ? "All Products" : "Results for $searchQuery",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  /// PRODUCT GRID
                  GridView.builder(
                    shrinkWrap: true,

                    physics:
                        const NeverScrollableScrollPhysics(),

                    padding: EdgeInsets.zero,

                    itemCount: filteredProducts.length,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.68,
                    ),

                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: filteredProducts[index],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


/// CATEGORY BUTTON
class _CategoryButton extends StatelessWidget {
  final String title;
  final bool selected;

  const _CategoryButton({
    required this.title,
    this.selected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10,
      ),

      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),

      decoration: BoxDecoration(
        color: selected
            ? Colors.orange
            : Colors.white,

        borderRadius:
            BorderRadius.circular(20),
      ),

      child: Center(
        child: Text(
          title,

          style: TextStyle(
            color: selected
                ? Colors.white
                : Colors.black,

            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}