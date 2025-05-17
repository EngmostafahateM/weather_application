import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:weather_application/constants/images.dart';
import '../../controller/HomeController.dart';
import '../../widget/myList.dart';
import '../../widget/my_chart.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<HomeController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 400, // زودنا الارتفاع علشان ياخد الكارت
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                            Colors.black38, BlendMode.darken),
                        image: AssetImage(
                            'assets/images/cloud-in-blue-sky.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Stack(
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          leading: IconButton(
                            icon: Icon(Icons.menu, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 100, left: 20, right: 20),
                          child: TextField(
                            onChanged: (value) => controller.city = value,
                            textInputAction: TextInputAction.search,
                            onSubmitted: (value) => controller.updateWeather(),
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              suffixIcon:
                              Icon(Icons.search, color: Colors.white),
                              hintText: 'SEARCH',
                              hintStyle: TextStyle(color: Colors.white),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                          ),
                        ),

                        // ✅ كارت الطقس الرئيسي
                        Positioned(
                          top: 180,
                          left: 20,
                          right: 20,
                          child: Card(
                            color: Colors.white,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    controller.currentWeatherData.name!
                                        .toUpperCase(),
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    DateFormat().add_MMMMEEEEd().format(
                                        DateTime.now()),
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${controller.currentWeatherData.weather![0].description}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          Text(
                                            '${(controller.currentWeatherData.main!.temp! - 273.15).round()}\u2103',
                                            style: TextStyle(fontSize: 30),
                                          ),
                                          Text(
                                            'min: ${(controller.currentWeatherData.main!.tempMin! - 273.15).round()}°C / max: ${(controller.currentWeatherData.main!.tempMax! - 273.15).round()}°C',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          SizedBox(
                                            width: 80,
                                            height: 80,
                                            child: Lottie.asset(
                                                Images.cloudyAnim),
                                          ),
                                          Text(
                                            'wind ${controller.currentWeatherData.wind!.speed} m/s',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // باقي محتوى الشاشة
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text('Other City'.toUpperCase(),
                            style: Theme.of(context).textTheme.titleMedium),
                        MyList(),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Forecast Next 5 Days'.toUpperCase(),
                                style: Theme.of(context).textTheme.titleMedium),
                            Icon(Icons.next_plan_outlined,
                                color: Colors.black45),
                          ],
                        ),
                        MyChart(),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
