import 'dart:convert';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';


class WeatherProvider with ChangeNotifier {
  Weather? _weather;
  final String _apiKey = '5d26399264530b839af752bfd85be55e'; // Replace with your OpenWeatherMap API Key

  Weather? get weather => _weather;

  Future<void> fetchWeather(String city) async {
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$_apiKey');
    final response = await http.get(url);
       print(response.body);
    if (response.statusCode == 200) {
      _weather = Weather.fromJson(json.decode(response.body));
      notifyListeners();
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}
