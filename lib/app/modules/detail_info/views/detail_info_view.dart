import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weather_app/app/constant/colors.dart';
import 'package:weather_icons/weather_icons.dart';

import '../controllers/detail_info_controller.dart';

class DetailInfoView extends GetView<DetailInfoController> {
  Map<String, dynamic>? cityData = Get.arguments;

  @override
  Widget build(BuildContext context) {
  if(cityData == null){
    return Scaffold(
      body: Center(
        child: IconButton(
          icon: Icon(Icons.replay_outlined),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  } else {
    return Scaffold(
      backgroundColor: lightesBlue,
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
                        icon: const Icon(Icons.arrow_back_ios)
                      ),
                      Text(
                        "${cityData!['name']}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      IconButton(
                        onPressed: () => controller.getWeather(),
                        icon: const Icon(Icons.calendar_month)
                      ),
                    ],
                  ),
                  const SizedBox(height: 50,),
                  Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage("https://openweathermap.org/img/wn/${dataWeather['current']['weather'][0]['icon']}@2x.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Text(
                    '${dataWeather['current']['weather'][0]['main']}',
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '${dataWeather['current']['humidity']}',
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  Text(
                    '${dataWeather['current']['weather'][0]['description']}', //desc
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      )
    );
  }
    Get.back();
    return Scaffold(
      body: Container(
        child: Center(
          child: IconButton(
            icon: Icon(Icons.replay_outlined),
            onPressed: () => Get.back(),
          ),
        ),
      ),
    );

  }
}
