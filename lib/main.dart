import 'package:flutter/material.dart';
import 'package:weatherbuddy/screens/city_screen.dart';
import 'package:weatherbuddy/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
      routes: {
        '/city_screen': (context) => CityScreen(),
      },
    );
  }
}
