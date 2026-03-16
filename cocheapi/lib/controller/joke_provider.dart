import 'package:flutter/material.dart';
import '../model/joke_model.dart';
import '../service/joke_http_service.dart';

class JokeProvider extends ChangeNotifier {
  final JokeHttpService _service = JokeHttpService();

  JokeModel? _currentJoke;
  bool _loading = false;

  JokeModel? get currentJoke => _currentJoke;
  bool get loading => _loading;

  Future<void> fetchJoke() async {
    _loading = true;
    notifyListeners();

    try {
      _currentJoke = await _service.getRandomJoke();
    } catch (e) {
      print("Error al cargar chiste: $e");
      _currentJoke = null;
    }

    _loading = false;
    notifyListeners();
  }
}