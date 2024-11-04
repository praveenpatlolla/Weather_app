// class WeatherModel{
//   final double temp;
//   final double windSpeed;
//   final int feelsLike;
//   final int humidity;
//   final String condition;
//
//   WeatherModel({
//     this.temp,
//     this.windSpeed,
//     this.feelsLike,
//     this.humidity,
//     this.condition,
//   });
//
//
// }

// models/weather.dart
class Weather {
  final String description;
  final double temperature;

  Weather({required this.description, required this.temperature});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'] - 273.15, // Convert Kelvin to Celsius
    );
  }
}
