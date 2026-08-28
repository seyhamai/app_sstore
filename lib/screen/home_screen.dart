import 'package:flutter/material.dart';
import 'package:sstore_app/data/fake_data.dart';
import 'package:sstore_app/models/banner_model.dart';
import 'package:sstore_app/models/product_model.dart';
import 'package:sstore_app/theme/app_colors.dart';
import 'package:sstore_app/widgets/navigation/app_navigation_bar.dart';
import 'package:sstore_app/widgets/home/category_section.dart';
import 'package:sstore_app/widgets/home/home_search.dart';
import 'package:sstore_app/widgets/home/banner_slider.dart';
import 'package:sstore_app/widgets/home/product_section.dart';
import 'shop_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BannerModel> banners = FakeData.banners;

    return Scaffold(
      backgroundColor: AppColors.background, // Use the app's background color
      appBar: const AppNavigationBar(
        title: "Sstore",
        subtitle: "Welcome",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Wrap your existing search bar so it acts like a button
              GestureDetector(
                onTap: () {
                  // Opens the YouTube-style full-screen search overlay
                  showSearch(
                    context: context,
                    delegate: ProductSearchDelegate(),
                  );
                },
                child: AbsorbPointer(
                  // Prevents the keyboard from opening inline
                  child: HomeSearch(
                    onChanged: (value) {},
                  ),
                ),
              ),
              const SizedBox(height: 22),

              /// BANNER SLIDER
              BannerSlider(banners: banners),
              const SizedBox(height: 15),

              CategorySection(categories: FakeData.categories),
              const SizedBox(height: 15),

              /// Promotion
              ProductSection(
                title: "Promotion",
                products: FakeData.promotionProducts,
                onSeeAll: () {},
              ),

              /// Popular
              ProductSection(
                title: "Popular",
                products: FakeData.popularProducts,
                onSeeAll: () {},
              ),
              const SizedBox(height: 20),

              /// New Products
              ProductSection(
                title: "New Arrivals",
                products: FakeData.newProducts,
                onSeeAll: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The YouTube-Style Full Screen Search Delegate
class ProductSearchDelegate extends SearchDelegate<String> {
  @override
  String get searchFieldLabel => 'Search products...';
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      // The background color of the search overlay screen
      scaffoldBackgroundColor: AppColors.background, 
      
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background, // The top app bar color
        elevation: 1, // Slight shadow below the search bar
        iconTheme: IconThemeData(color: Colors.black), // Back and Clear icons color
      ),
      
      // Styling the search text input area
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(color: Colors.grey, fontSize: 16),
      ),

      // Text color of what the user is typing
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: AppColors.textPrimary, fontSize: 18),
      ),
      
      // The color of the text cursor
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: AppColors.primary,
      ),
    );
  }
  

  // The clear button on the right side of the search bar
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = ''; // Clear the search bar
          },
        ),
    ];
  }

  // The back button on the left side of the search bar
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, ''); // Close the search overlay
      },
    );
  }

  // Action to perform when the user hits "Enter" on the keyboard
  @override
  Widget buildResults(BuildContext context) {
    _navigateToShopScreen(context, query);
    return const SizedBox(); 
  }

  // The vertical list of suggestions that updates as they type
  @override
  Widget buildSuggestions(BuildContext context) {
    final lowerQuery = query.trim().toLowerCase();

    // Gather all possible names for suggestions
    final productNames = [
      ...FakeData.promotionProducts,
      ...FakeData.popularProducts,
      ...FakeData.newProducts,
    ].map((product) => product.name);
    
    final categoryNames = FakeData.categories.map((category) => category.name);

    // Filter suggestions based on what is typed
    final suggestions = {...productNames, ...categoryNames}
        .where((name) => lowerQuery.isEmpty || name.toLowerCase().contains(lowerQuery))
        .toList();

    if (suggestions.isEmpty) {
      return const Center(
        child: Text('No results found'),
      );
    }

    // YouTube-style vertical list view
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];
        return ListTile(
          leading:  Icon(Icons.search, color: Colors.grey), // Standard search icon
          title: Text(suggestion),
          trailing: const Icon(Icons.north_west, size: 18, color: Colors.grey), // YouTube puts this arrow here
          onTap: () {
            // Fill the query or go directly to results
            query = suggestion;
            _navigateToShopScreen(context, suggestion);
          },
        );
      },
    );
  }

  // Helper method to filter products and navigate
  void _navigateToShopScreen(BuildContext context, String suggestion) {
    if (suggestion.trim().isEmpty) return;

    final allProducts = [
      ...FakeData.promotionProducts,
      ...FakeData.popularProducts,
      ...FakeData.newProducts,
    ];

    final filteredProducts = allProducts
        .where((product) => product.name.toLowerCase().contains(suggestion.trim().toLowerCase()))
        .toList();

    // Close the Search Overlay first
    close(context, suggestion);

    // Push the Shop Screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ShopScreen(
          searchQuery: suggestion,
          products: filteredProducts,
        ),
      ),
    );
  }
}