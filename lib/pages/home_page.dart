import 'package:flutter/material.dart';
import 'package:flutter_weather/models/weather_model.dart';
import 'package:flutter_weather/pages/search_page.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
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
           Spacer(flex: 3,),
           const Text(
               'Cairo',
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           const SizedBox(height: 20,),
           const Text(
             'Updated at: 12-11-2023',
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           Spacer(),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Image.asset('assets/images/clear.png'),
               const SizedBox(width: 10,),
               const Text(
                 '30',
                 style: TextStyle(
                   fontSize: 32,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               Column(
                 children: const [
                   Text('Max Temp: 30'),
                   Text('Min Temp: 27'),
                 ],
               )
             ],
           ),
           Spacer(),
           const Text(
             'Clear',
             style: TextStyle(
               fontSize: 32,
               fontWeight: FontWeight.bold,
             ),
           ),
           Spacer(flex: 5,),
         ],
       ),
     )

      ,
    );
  }
}
