import 'package:ecommerce/models/customization_model.dart';
import 'package:flutter/material.dart';

class CustomizationProvider with ChangeNotifier {
  Customization _selectedCustomization = Customization();

  Customization get selectedCustomization => _selectedCustomization;

  double get wrapFee => _selectedCustomization.wrapGiftPrice;

  void selectCustomization(Customization method) {
    _selectedCustomization = method;
    notifyListeners();
  }
}
