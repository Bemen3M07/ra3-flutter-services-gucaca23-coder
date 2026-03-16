import 'dart:convert';

List<JokeModel> jokesFromJson(String str) =>
    List<JokeModel>.from(json.decode(str).map((x) => JokeModel.fromJson(x)));

String jokesToJson(List<JokeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class JokeModel {
  JokeModel({
    required this.id,
    required this.joke,
  });

  final int id;
  final String joke;

  factory JokeModel.fromJson(Map<String, dynamic> json) {
    String jokeText = "";

    if (json["joke"] != null) {
      jokeText = json["joke"];
    } else {
      String setup = json["setup"] ?? "";
      String punchline = json["punchline"] ?? "";
      jokeText = "$setup\n\n$punchline";
    }

    return JokeModel(
      id: json["id"] ?? 0,
      joke: jokeText,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "joke": joke,
      };
}