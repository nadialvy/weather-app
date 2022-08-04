import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/constant/colors.dart';
import 'package:intl/intl.dart';
import "string_extension.dart";

import '../controllers/detail_info_controller.dart';

class DetailInfoView extends GetView<DetailInfoController> {
  Map<String, dynamic>? cityData = Get.arguments;

  @override
  Widget build(BuildContext context) {
  if(cityData == null){
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: const Icon(Icons.replay_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  } else {
    return Scaffold(
      backgroundColor: mainBlue,
      body: StreamBuilder<Map<String, dynamic>>(
        stream: controller.getWeather(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          Map<dynamic, dynamic>? dataWeather = snapshot.data!;
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              width: Get.width,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white
                      ),
                      const Text(
                        "Today's Weather Forecast",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      Container(),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: lightesBlue
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.location_on_rounded),
                                  const SizedBox(width: 10,),
                                  Text(
                                    "${cityData!['name']}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.calendar_today),
                                  const SizedBox(width: 10,),
                                  Text(
                                    DateFormat.yMMMEd().format(DateTime.now()),
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),

                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.network(
                                "https://openweathermap.org/img/wn/${dataWeather['current']['weather'][0]['icon']}@2x.png"
                              ),
                              const Padding(
                                padding: EdgeInsets.only(right: 10),
                                child: Text(
                                  '27°',
                                  style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${dataWeather['current']['weather'][0]['main']}',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'Humidity : ${dataWeather['current']['humidity']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${dataWeather['current']['weather'][0]['description']}'.toTitleCase(),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'Clouds : ${dataWeather['current']['clouds']}',
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                ],
              ),
            ),
          );
        }
      )
    );
  }
  }
}
