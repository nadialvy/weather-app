import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/constant/colors.dart';
import 'package:intl/intl.dart';
import "string_extension.dart";

import '../controllers/detail_info_controller.dart';

class DetailInfoView extends GetView<DetailInfoController> {
  Map<String, dynamic>? cityData = Get.arguments;

  DetailInfoView({Key? key}) : super(key: key);

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
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: StreamBuilder<Map<String, dynamic>>(
        stream: controller.getWeather(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          Map<dynamic, dynamic> dataWeather = snapshot.data!;
          if(dataWeather["message"] == null){
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () => Get.back(),
                              icon: const Icon(Icons.arrow_back_ios),
                              color: mainText
                            ),
                            const Text(
                              "Today's Weather Forecast",
                              style: TextStyle(
                                fontSize: 18,
                                color: mainText,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Container(),
                          ],
                        ),
                        const SizedBox(height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${cityData!['name']}",
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: mainText
                                ),
                            ),
                            Text(
                              '${DateFormat.EEEE().format(DateTime.now())}, ${DateFormat.j().format(DateTime.now())}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: subText
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 50,),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: Get.width * 0.3 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: lightBlue2,
                            ),
                            child: Image.network(
                              "https://openweathermap.org/img/wn/${dataWeather['current']['weather'][0]['icon']}@2x.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          const Text(
                            '27° C',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w500,
                              color: mainText
                            ),
                          ),
                          Text(
                            '${dataWeather['current']['weather'][0]['main']}',
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: mainText
                            ),
                          ),
                          Text(
                            '${dataWeather['current']['weather'][0]['description']}'.toTitleCase(),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: subText
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: mediumBlueAlpha)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Today',
                              style: TextStyle(
                                fontSize: 18,
                                color: mainText,
                                fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    const Text(
                                      'Pressure',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: subText
                                      ),
                                    ),
                                    Text(
                                      '${dataWeather['current']['pressure']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: mainText
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Humidity',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: subText
                                      ),
                                    ),
                                    Text(
                                      '${dataWeather['current']['humidity']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: mainText
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    const Text(
                                      'Clouds',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: subText
                                      ),
                                    ),
                                    Text(
                                      '${dataWeather['current']['clouds']}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: mainText
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }else {
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
                        color: Colors.white
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Image.asset('assets/404.jpg'),
                            const SizedBox(height: 20,),
                            const Text(
                              'Data not found! There is no latitude or longitude found!',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: warningRed
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          
        }
      )
    );
  }
  }
}
