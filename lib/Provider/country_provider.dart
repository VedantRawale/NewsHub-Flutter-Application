import 'package:flutter/foundation.dart';
import 'package:news_hub_app/constants.dart';

class CountryProvider with ChangeNotifier {
  String _country = "in";
  String get country => _country;
  void setCountry(String country) {
    _country = country;
    notifyListeners();
  }
}
