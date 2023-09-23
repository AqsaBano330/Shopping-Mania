import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class CartModel extends ChangeNotifier {
  int itemCount = 0;

  void addToCart() {
    itemCount++;
    notifyListeners();
  }
}
