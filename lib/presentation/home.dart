// screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/weather_service.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title:  const Center(child: Text('Weather App'))),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller,
                decoration: const InputDecoration(labelText: 'Enter city name'),
              ),
              ElevatedButton(
                onPressed: () {
                  final city = _controller.text;
                  if (city.isNotEmpty) {
                    Provider.of<WeatherProvider>(context, listen: false)
                        .fetchWeather(city);
                  }
                },
                child: const Text('Get Weather'),
              ),
              Consumer<WeatherProvider>(
                builder: (context, weatherProvider, child) {
                  final weather = weatherProvider.weather;
                  if (weather == null) {
                    return const Text('Enter a city to get weather info.');
                  }
                  return Column(
                    children: [
                      Text('Temperature: ${weather.temperature.toStringAsFixed(1)}°C'),
                      Text('Description: ${weather.description}'),
                      // Text('Humidity: ${weather.humidity}'),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
