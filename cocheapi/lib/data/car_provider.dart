import 'package:flutter/material.dart';
import 'package:cocheapi/data/CarsModel';
import 'car_http_service.dart';

class CarProvider extends ChangeNotifier {
  final CarHttpService _service = CarHttpService();
  List<CarsModel> _cars = [];
  bool _loading = false;

  List<CarsModel> get cars => _cars;
  bool get loading => _loading;

  Future<void> getCarsData() async {
    _loading = true;
    notifyListeners();

    try {
      _cars = await _service.getCars();
    } catch (e) {
      print(e);
    }

    _loading = false;
    notifyListeners();
  }
}

