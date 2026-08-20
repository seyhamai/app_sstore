import 'package:flutter/material.dart';

import '../services/cart_service.dart';
import '../theme/app_colors.dart';
import '../widgets/cart/cart_item_card.dart';

class CheckoutScreen extends StatefulWidget {
  final List<CartItem> items;
  final bool clearCartOnSuccess;

  const CheckoutScreen({
    super.key,
    required this.items,
    this.clearCartOnSuccess = false,
  });

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final addressController = TextEditingController();
  String paymentMethod = 'Cash on delivery';

  double get subtotal => widget.items.fold(0, (sum, item) => sum + item.total);

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }

  void placeOrder() {
    if (addressController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a delivery address')),
      );
      return;
    }

    if (widget.clearCartOnSuccess) {
      CartService.instance.clear();
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Order placed successfully')));
    Navigator.popUntil(context, (route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
        children: [
          const _SectionTitle(title: 'Order items'),
          const SizedBox(height: 12),
          ...widget.items.map(
            (item) => CartItemCard(
              item: item,
              readOnly: true,
              onQuantityChanged: (_) {},
              onRemove: () {},
            ),
          ),
          const SizedBox(height: 8),
          const _SectionTitle(title: 'Delivery address'),
          const SizedBox(height: 10),
          _CheckoutPanel(
            child: TextField(
              controller: addressController,
              maxLines: 3,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                hintText: 'Enter your full delivery address',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _SectionTitle(title: 'Payment method'),
          const SizedBox(height: 10),
          _CheckoutPanel(
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: paymentMethod,
                isExpanded: true,
                items: const [
                  DropdownMenuItem(
                    value: 'Cash on delivery',
                    child: Text('Cash on delivery'),
                  ),
                  DropdownMenuItem(
                    value: 'Card payment',
                    child: Text('Card payment'),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    setState(() => paymentMethod = value);
                  }
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          const _SectionTitle(title: 'Order summary'),
          const SizedBox(height: 10),
          _CheckoutPanel(
            child: Column(
              children: [
                _SummaryRow(label: 'Subtotal', value: subtotal),
                const SizedBox(height: 10),
                const _SummaryRow(label: 'Delivery', value: 0),
                const Divider(height: 24),
                _SummaryRow(label: 'Total', value: subtotal, emphasize: true),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(16, 10, 16, 10),
        child: SizedBox(
          height: 52,
          child: ElevatedButton.icon(
            onPressed: placeOrder,
            icon: const Icon(Icons.lock_outline, size: 18),
            label: Text('Place order  |  \$${subtotal.toStringAsFixed(2)}'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}

class _CheckoutPanel extends StatelessWidget {
  final Widget child;

  const _CheckoutPanel({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: child,
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final double value;
  final bool emphasize;

  const _SummaryRow({
    required this.label,
    required this.value,
    this.emphasize = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
      fontWeight: emphasize ? FontWeight.bold : FontWeight.normal,
      fontSize: emphasize ? 17 : 14,
      color: emphasize ? AppColors.textPrimary : AppColors.textSecondary,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: style),
        Text('\$${value.toStringAsFixed(2)}', style: style),
      ],
    );
  }
}
