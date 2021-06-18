import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'api/restaurent.dart';

class Cart extends ChangeNotifier {
  ///
  static Cart _instance;
  Cart._();
  static Cart get getInstance => _instance ??= Cart._();
  factory Cart() {
    return _instance;
  }
  List<CategoryDish> _cartList = [];
  UnmodifiableListView<CategoryDish> get cartList =>
      UnmodifiableListView(_cartList);
  double _totalPrice = 0.00;
  double totalPrice() {
    _totalPrice = 0;
    _cartList.forEach((element) {
      _totalPrice = _totalPrice + element.dishPrice;
    });
    return _totalPrice;
  }

  int get cartLength => _cartList.length;
//  List<CategoryDish> get cartList => _cartList;

  addToCart(CategoryDish categoryDish) {
    _cartList.add(categoryDish);
    print(_cartList.hashCode);
    print(_cartList.length);
    notifyListeners();
  }

  removeFromCart(CategoryDish categoryDish) {
    _cartList.remove(categoryDish);
    print(_cartList.hashCode);
    print(_cartList.length);

    notifyListeners();
  }
}
