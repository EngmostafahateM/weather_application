import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_application/pages/home/home_screen.dart';
import 'package:weather_application/utils/Binding/HomeBinding.dart';
// main Weather App
void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomeScreen(),
          binding: HomeBinding(),
        )
      ],
    );
  }
}
