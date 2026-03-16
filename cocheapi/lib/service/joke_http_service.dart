import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import '../model/joke_model.dart';

class JokeHttpService {
  final String _url = "https://api.sampleapis.com/jokes/goodJokes";

  Future<JokeModel> getRandomJoke() async {
    final uri = Uri.parse(_url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      final random = Random();
      final randomjoke = data[random.nextInt(data.length)];
      return JokeModel.fromJson(randomjoke);
    } else {
      throw Exception("Error al cargar los chistes");
    }
  }

}