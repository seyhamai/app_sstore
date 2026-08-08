import 'package:flutter/material.dart';
import 'package:sstore_app/data/fake_data.dart';
import 'package:sstore_app/models/banner_model.dart';
import 'package:sstore_app/widgets/home/home_app_bar.dart';
import 'package:sstore_app/widgets/home/category_section.dart';
import 'package:sstore_app/widgets/home/home_search.dart';
import 'package:sstore_app/widgets/home/banner_slider.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<BannerModel> banners = FakeData.banners;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      //widget for app bar
      appBar: const HomeAppBar(),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // widget for search
              const HomeSearch(),
              const SizedBox(height: 10),

              /// BANNER SLIDER
              BannerSlider(banners: banners),
              const SizedBox(height: 15), 

               CategorySection(
              categories: FakeData.categories),
              const SizedBox(height: 15), 
            ],
          ),
        ),
      ),
    );
  }
}