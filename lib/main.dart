// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/presentation/home.dart';
import 'package:weather_app/services/weather_service.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}
