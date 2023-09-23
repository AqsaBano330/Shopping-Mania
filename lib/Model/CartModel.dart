import 'package:flutter/widgets.dart';

class CartModel extends ChangeNotifier {
  int itemCount = 0;

  void addToCart() {
    itemCount++;
    notifyListeners();
  }
}
