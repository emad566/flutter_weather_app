import 'package:flutter/material.dart';
import 'package:flutter_weather/models/weather_model.dart';
import 'package:flutter_weather/providers/weather_provider.dart';
import 'package:flutter_weather/services/weather_service.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

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
          onSubmitted: (String value) async{
            cityName = value;

            WeatherService service = WeatherService();
            WeatherModel weather = await service.getWeather(cityName: cityName!);
            // ignore: use_build_context_synchronously
            Provider.of<WeatherProvider>(context,listen: false).weatherDate = weather;
            Get.back();
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
