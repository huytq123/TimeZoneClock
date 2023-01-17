import 'package:flutter/material.dart';
import 'package:test_flutter_2/pages/choose_location.dart';
import 'package:test_flutter_2/pages/home.dart';
import 'package:test_flutter_2/pages/loading.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loading(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation()
    },
  ));
}
