import 'package:flutter/material.dart';
import 'package:flutter_weather/models/weather_model.dart';
import 'package:flutter_weather/pages/search_page.dart';
import 'package:flutter_weather/providers/weather_provider.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData = Provider.of<WeatherProvider>(context).weatherDate;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: (){
              Get.to(SearchScreen());
            },
            icon: const Icon(Icons.search, size: 24,),
          ),
        ],
      ),
      // ignore: unnecessary_null_comparison
      body: weatherData == null ? Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'there is no weather 😔 start',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              'searching now 🔍',
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      )
      :
     Container(
       color: Colors.orange,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           const Spacer(flex: 3,),
           Text(
             weatherData.cityName,
             style: const TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           const SizedBox(height: 20,),
           Text(
             weatherData.date,
             style: const TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           const Spacer(),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Image.asset('assets/images/clear.png'),
               const SizedBox(width: 10,),
               Text(
                 weatherData.temp.toInt().toString(),
                 style: const TextStyle(
                   fontSize: 32,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Column(
                 children: [
                   Text('Max Temp: ${weatherData.maxTemp.toInt().toString()}'),
                   Text('Min Temp: ${weatherData.minTemp.toInt().toString()}'),
                 ],
               )
             ],
           ),
           const Spacer(),
           Text(
             weatherData.weatherStateName,
             style: const TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           const Spacer(flex: 5,),
         ],
       ),
     )

      ,
    );
  }
}
