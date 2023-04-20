class WeatherModel{
  late String date;
  late double temp;
  late double maxTemp;
  late double minTemp;
  late String weatherStateName;

  WeatherModel({required this.date, required this.temp, required this.maxTemp, required this.minTemp, required this.weatherStateName});

  factory WeatherModel.fromJson(Map<String, dynamic> json){
    Map<String, dynamic> jsonData = json['forecast']['forecastday'][0]['day'];


    return WeatherModel(
      date: json['location']['localtime'],
      temp: jsonData['avgtemp_c'],
      maxTemp: jsonData['maxtemp_c'],
      minTemp: jsonData['mintemp_c'],
      weatherStateName: jsonData['condition']['text'],
    );
  }
}