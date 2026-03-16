import 'package:cocheapi/data/CarsModel.dart' show CarsModel;
import 'package:cocheapi/data/car_http_service.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group('CarsApi', () {
    test('getCars devuelve una lista válida de coches', () async {
      final carHttpService = CarHttpService();

      final List<CarsModel> cars = await carHttpService.getCars();

      // Comprobaciones seguras
      expect(cars, isNotEmpty);
      expect(cars.first.id, isNotNull);
      expect(cars.first.make, isNotEmpty);
    });
  });
}