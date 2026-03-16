import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/joke_provider.dart';
import 'view/jokes_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => JokeProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Chistes Aleatorios", 
        home: JokesPage(),
      ),
    ),
  );
}