import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String name;
  final String sauce;
  final bool fries;
  final String? friesSize;
  final bool soda;
  final String? selectedSoda;
  final bool extraSauce;
  final double price;

  CartItem({
    required this.id,
    required this.name,
    required this.sauce,
    required this.fries,
    this.friesSize,
    required this.soda,
    this.selectedSoda,
    required this.extraSauce,
    required this.price,
  });
}

class CartService extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  bool get hasItems => _items.isNotEmpty;

  int get itemCount => _items.length;

  double get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.price);
  }

  void addItem(CartItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(String id) {
    _items.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
