import 'package:flutter/material.dart';

import '../services/cart_service.dart';
import '../theme/app_colors.dart';
import '../widgets/cart/cart_item_card.dart';
import 'checkout_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = CartService.instance;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: AnimatedBuilder(
        animation: cart,
        builder: (context, child) {
          if (cart.items.isEmpty) {
            return const _EmptyCart();
          }

          return ListView(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
            children: [
              Text(
                '${cart.itemCount} item${cart.itemCount == 1 ? '' : 's'}',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 12),
              ...cart.items.map(
                (item) => CartItemCard(
                  item: item,
                  onQuantityChanged: (quantity) =>
                      cart.updateQuantity(item, quantity),
                  onRemove: () => cart.remove(item),
                ),
              ),
              const SizedBox(height: 8),
              _OrderSummary(cart: cart),
            ],
          );
        },
      ),
    );
  }
}

class _OrderSummary extends StatelessWidget {
  final CartService cart;

  const _OrderSummary({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal'),
              Text('\$${cart.total.toStringAsFixed(2)}'),
            ],
          ),
          const SizedBox(height: 14),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CheckoutScreen(
                      items: List<CartItem>.from(cart.items),
                      clearCartOnSuccess: true,
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.lock_outline, size: 18),
              label: const Text('Checkout'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyCart extends StatelessWidget {
  const _EmptyCart();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.shopping_cart_outlined,
              size: 64,
              color: AppColors.textSecondary.withOpacity(0.65),
            ),
            const SizedBox(height: 16),
            const Text(
              'Your cart is empty',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'Add products from the shop to see them here.',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.textSecondary),
            ),
          ],
        ),
      ),
    );
  }
}
