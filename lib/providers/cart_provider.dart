import 'package:app_flutter/models/cart_item.dart';
import 'package:app_flutter/repositories/cart_repository.dart';
import 'package:flutter/foundation.dart';

class CartProvider with ChangeNotifier {
  final CartRepository _cartRepository = CartRepository();
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  Future<void> fetchCartItems() async {
    _cartItems = await _cartRepository.getCartItems();
    notifyListeners();
  }

  Future<void> addToCart(CartItem cartItem) async {
    await _cartRepository.addToCart(cartItem);
    await fetchCartItems();
  }

  Future<void> removeFromCart(int id) async {
    await _cartRepository.removeFromCart(id);
    await fetchCartItems();
  }
}
