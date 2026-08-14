import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:sstore_app/theme/app_colors.dart';
import '../../models/banner_model.dart';

class BannerSlider extends StatefulWidget {
  final List<BannerModel> banners;

  const BannerSlider({
    super.key,
    required this.banners,
  });

  @override
  State<BannerSlider> createState() =>
      _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Prevent errors if there are no banners
    if (widget.banners.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Special Offers",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        /// BANNER SLIDER
        CarouselSlider.builder(
          itemCount: widget.banners.length,

          options: CarouselOptions(
            height: 180,

            autoPlay: widget.banners.length > 1,

            autoPlayInterval:
                const Duration(seconds: 4),

            enlargeCenterPage: true,

            viewportFraction: 1,

            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),

          itemBuilder: (
            context,
            index,
            realIndex,
          ) {
            final banner =
                widget.banners[index];

            return _buildBanner(banner);
          },
        ),

        const SizedBox(height: 12),

        /// DOT INDICATOR
        if (widget.banners.length > 1)
          Row(
            mainAxisAlignment:
                MainAxisAlignment.center,

            children: List.generate(
              widget.banners.length,
              (index) {
                return AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 600,
                  ),

                  margin:
                      const EdgeInsets.symmetric(
                    horizontal: 4,
                  ),
                  
                    width: 8,
                    height: 8,

                  decoration: BoxDecoration(
                    color: currentIndex == index
                        ? AppColors.primary
                        : Colors.grey.shade400,

                    borderRadius:
                        BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  Widget _buildBanner(
    BannerModel banner,
  ) {
    return Container(
      width: double.infinity,

      decoration: BoxDecoration(
        color: _getBannerColor(
          banner.color,
        ),

        borderRadius:
            BorderRadius.circular(20),

        image: banner.background != null
            ? DecorationImage(
                image: AssetImage(
                  banner.background!,
                ),

                fit: BoxFit.cover,

                colorFilter:
                    ColorFilter.mode(
                  Colors.black.withOpacity(0.35),
                  BlendMode.darken,
                ),
              )
            : null,
      ),

      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Row(
          children: [

            /// LEFT CONTENT
            Expanded(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,

                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  Text(
                    banner.title,

                    maxLines: 1,

                    overflow:
                        TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    banner.subtitle,

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,

                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 12),

                  SizedBox(
                    height: 36,

                    child: ElevatedButton(
                      onPressed: () {
                        // TODO:
                        // Navigate to promotion
                      },

                      style:
                          ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.white,

                        foregroundColor:
                            Colors.indigo,

                        elevation: 0,
                      ),

                      child: const Text(
                        "Shop Now",
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            /// RIGHT ICON
            const Icon(
              Icons.shopping_bag,
              color: Colors.white,
              size: 65,
            ),
          ],
        ),
      ),
    );
  }

  Color _getBannerColor(
    String color,
  ) {
    switch (color) {
      case "deepOrange":
        return Colors.deepOrange;

      case "green":
        return Colors.green;

      case "indigo":
      default:
        return Colors.indigo;
    }
  }
}
