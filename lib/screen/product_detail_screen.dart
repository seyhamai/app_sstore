import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../theme/app_colors.dart';
class ProductDetailScreen extends StatefulWidget {
  final ProductModel product;

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState
    extends State<ProductDetailScreen> {

  int selectedSizeIndex = -1;
  int selectedColorIndex = 0;
  int quantity = 1;

  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        backgroundColor: AppColors.surface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
            size: 20,
          ),
        ),

        title: const Text(
          "Product Detail",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),

        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            icon: Icon(
              isFavorite
                  ? Icons.favorite
                  : Icons.favorite_border,
              color: isFavorite
                  ? AppColors.sale
                  : Colors.black,
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// PRODUCT IMAGE
            Container(
              width: double.infinity,
              height: 320,
              color: Colors.white,

              child: Padding(
                padding: const EdgeInsets.all(20),

                child: Image.asset(
                  product.image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// PRODUCT INFORMATION
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),

              decoration: const BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [

                  /// NAME + RATING
                  Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      Expanded(
                        child: Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ),

                      const SizedBox(width: 10),

                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 18,
                          ),

                          const SizedBox(width: 4),

                          Text(
                            product.rating
                                .toStringAsFixed(1),
                            style:
                                const TextStyle(
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  /// PRICE
                  Row(
                    children: [

                      Text(
                        "\$${product.price.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 22,
                          color: AppColors.sale,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      if (product.oldPrice != null) ...[
                        const SizedBox(width: 10),

                        Text(
                          "\$${product.oldPrice!.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondary,
                            decoration:
                                TextDecoration
                                    .lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// DESCRIPTION
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 14,
                      color: AppColors.textSecondary,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 20),

                  /// SIZE
                  if (product.sizes.isNotEmpty) ...[
                    const Text(
                      "Size",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      height: 45,

                      child: ListView.builder(
                        scrollDirection:
                            Axis.horizontal,

                        itemCount:
                            product.sizes.length,

                        itemBuilder:
                            (context, index) {

                          final selected =
                              selectedSizeIndex ==
                                  index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSizeIndex =
                                    index;
                              });
                            },

                            child: Container(
                              width: 45,

                              margin:
                                  const EdgeInsets
                                      .only(
                                right: 10,
                              ),

                              decoration:
                                  BoxDecoration(
                                color: selected
                                    ? AppColors.primary
                                    : Colors.white,

                                borderRadius:
                                    BorderRadius
                                        .circular(10),

                                border: Border.all(
                                  color: selected
                                      ? AppColors.primary
                                      : AppColors.border,
                                ),
                              ),

                              child: Center(
                                child: Text(
                                  product
                                      .sizes[index],

                                  style: TextStyle(
                                    color: selected
                                        ? AppColors.surface
                                        : AppColors.textPrimary,

                                    fontWeight:
                                        FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],

                  /// COLOR
                  if (product.colors.isNotEmpty) ...[
                    const Text(
                      "Color",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      height: 40,

                      child: ListView.builder(
                        scrollDirection:
                            Axis.horizontal,

                        itemCount:
                            product.colors.length,

                        itemBuilder:
                            (context, index) {

                          final selected =
                              selectedColorIndex ==
                                  index;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColorIndex =
                                    index;
                              });
                            },

                            child: Container(
                              margin:
                                  const EdgeInsets
                                      .only(
                                right: 10,
                              ),

                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 16,
                              ),

                              decoration:
                                  BoxDecoration(
                                color: selected
                                    ? AppColors.primary
                                    : AppColors.border,

                                borderRadius:
                                    BorderRadius
                                        .circular(20),
                              ),

                              child: Center(
                                child: Text(
                                  product
                                      .colors[index],

                                  style: TextStyle(
                                    fontSize: 13,

                                    color: selected
                                        ? Colors.white
                                        : Colors
                                            .black,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],

                  /// QUANTITY
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,

                    children: [

                      const Text(
                        "Quantity",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius:
                              BorderRadius.circular(
                            10,
                          ),
                        ),

                        child: Row(
                          children: [

                            IconButton(
                              onPressed: quantity > 1
                                  ? () {
                                      setState(() {
                                        quantity--;
                                      });
                                    }
                                  : null,

                              icon: const Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),

                            Text(
                              quantity.toString(),

                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                setState(() {
                                  quantity++;
                                });
                              },

                              icon: const Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// ACTION BUTTONS
                  Row(
                    children: [

                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            // Add to cart
                          },

                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(
                              double.infinity,
                              52,
                            ),

                            side: const BorderSide(
                              color: AppColors.border,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),

                            overlayColor: Colors.grey,
                          ),

                          child: const Text(
                            "Add to Cart",
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),

                      Expanded(
                        child:
                            ElevatedButton(
                          onPressed: () {
                            // TODO:
                            // Buy now
                          },

                          style:
                              ElevatedButton
                                  .styleFrom(
                            minimumSize:
                                const Size(
                              double.infinity,
                              52,
                            ),

                            backgroundColor:
                                AppColors.primary,

                            foregroundColor:
                                Colors.white,

                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(
                                12,
                              ),
                            ),
                              overlayColor: AppColors.textSecondary
                          ),

                          child:
                              const Text(
                            "Buy Now",
                            style: TextStyle(
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}