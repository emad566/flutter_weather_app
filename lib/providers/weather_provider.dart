import 'package:flutter/material.dart';
import 'package:flutter_weather/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier
{
    WeatherModel? _weatherDate;

    set weatherDate(WeatherModel? weather){
      _weatherDate = weather;
      notifyListeners();
    }

    WeatherModel? get weatherDate => _weatherDate;
}