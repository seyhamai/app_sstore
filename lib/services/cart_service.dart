import 'package:flutter/foundation.dart';

import '../models/product_model.dart';

class CartItem {
  final ProductModel product;
  final String? size;
  final String? color;
  int quantity;

  CartItem({
    required this.product,
    required this.quantity,
    this.size,
    this.color,
  });

  double get total => product.price * quantity;
}

class CartService extends ChangeNotifier {
  CartService._();

  static final CartService instance = CartService._();

  final List<CartItem> _items = [];

  List<CartItem> get items => List.unmodifiable(_items);

  int get itemCount => _items.fold(0, (total, item) => total + item.quantity);

  double get total => _items.fold(0, (sum, item) => sum + item.total);

  void addProduct(
    ProductModel product, {
    int quantity = 1,
    String? size,
    String? color,
  }) {
    final existingIndex = _items.indexWhere(
      (item) =>
          item.product.id == product.id &&
          item.size == size &&
          item.color == color,
    );

    if (existingIndex == -1) {
      _items.add(
        CartItem(
          product: product,
          quantity: quantity.clamp(1, 99),
          size: size,
          color: color,
        ),
      );
    } else {
      final item = _items[existingIndex];
      item.quantity = (item.quantity + quantity).clamp(1, 99);
    }

    notifyListeners();
  }

  void updateQuantity(CartItem item, int quantity) {
    if (quantity <= 0) {
      _items.remove(item);
    } else {
      item.quantity = quantity.clamp(1, 99);
    }
    notifyListeners();
  }

  void remove(CartItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}
