import 'package:flutter/material.dart';
import 'package:flutter_weather/services/weather_service.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: TextField(
          onSubmitted: (String value){
            cityName = value;

            WeatherService service = WeatherService();
            service.getWeather(cityName: cityName!);
          },
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
            label: Text('Search'),
            suffixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
            hintText: 'Enter a city',
          ),
        ),
      ),
    );
  }
}
