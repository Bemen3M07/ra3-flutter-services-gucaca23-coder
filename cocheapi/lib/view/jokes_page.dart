import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/joke_provider.dart';

class JokesPage extends StatelessWidget {
  const JokesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<JokeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Chistes Aleatorios")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => provider.fetchJoke(),
              child: const Text("Obtener chiste"),
            ),
            const SizedBox(height: 20),
            provider.loading
                ? const CircularProgressIndicator()
                : provider.currentJoke == null
                    ? const Text("Presiona el botón para obtener un chiste")
                    : Text(
                        provider.currentJoke!.joke,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
          ],
        ),
      ),
    );
  }
}