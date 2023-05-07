import 'package:flutter/material.dart';

import '../../domain/models/purchasedVegetables.dart';

class PurchaseProvider extends ChangeNotifier {
  final List<PurchasedVegetables> purchasedVeges = [];

  void updateSelectionOfPurchasedVege(PurchasedVegetables purchasedVegetables) {
    purchasedVeges.forEach((element) {
      if (purchasedVegetables.id == element.id)
        element.copyWith(selected: purchasedVegetables.selected);
      notifyListeners();
    });
  }
}
