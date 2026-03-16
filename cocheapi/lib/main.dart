import 'package:flutter/material.dart';
import 'package:cocheapi/data/CarsModel.dart';
import 'package:cocheapi/data/car_http_service.dart'; // tu servicio HTTP ya hecho


void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: CarsPage(),
  ));
}


class CarsPage extends StatefulWidget {
  const CarsPage({Key? key}) : super(key: key);


  @override
  State<CarsPage> createState() => _CarsPageState();
}


class _CarsPageState extends State<CarsPage> {
  final CarHttpService _service = CarHttpService();
  Future<List<CarsModel>>? _carsFuture;


  void _loadCars() {
    setState(() {
      _carsFuture = _service.getCars(); // tu método ya existente
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Autos")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _loadCars,
              child: const Text("Cargar Autos"),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: _carsFuture == null
                  ? const Center(
                      child: Text("Presiona el botón para cargar autos"),
                    )
                  : FutureBuilder<List<CarsModel>>(
                      future: _carsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        }


                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error: ${snapshot.error}"),
                          );
                        }


                        if (!snapshot.hasData || snapshot.data!.isEmpty) {
                          return const Center(child: Text("No hay autos"));
                        }


                        final cars = snapshot.data!;


                        return ListView.builder(
                          itemCount: cars.length,
                          itemBuilder: (context, index) {
                            final car = cars[index];
                            return Card(
                              child: ListTile(
                                title: Text("${car.make} ${car.model}"),
                                subtitle: Text("Año: ${car.year} - Tipo: ${car.type}"),
                              ),
                            );
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
