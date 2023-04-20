import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_weather/models/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherService{
  final String baseUrl = 'http://api.weatherapi.com/';
  final String apiKey = 'f3e25be4a1424ec5b48182556232004';

  Future<WeatherModel> getWeather({required String cityName}) async{
    Uri url = Uri.parse('${baseUrl}v1/forecast.json?key=$apiKey&q=London&aqi=no');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);
    WeatherModel w1 = WeatherModel.fromJson(data);
    if (kDebugMode) {
      print(w1.date);
    }

    return w1;
  }
}