import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/constant/colors.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/app/constant/dimensions.dart';
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
            var celcius = dataWeather['current']['temp']-273;
            var timeStampSunrise = dataWeather['current']['sunrise'];
            var sunrise = DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(timeStampSunrise * 1000));
            var timeStampSunset = dataWeather['current']['sunset'];
            var sunset = DateFormat.jm().format(DateTime.fromMillisecondsSinceEpoch(timeStampSunset * 1000));
            
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.width40),
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
                            Text(
                              "Today's Weather Forecast",
                              style: TextStyle(
                                fontSize: Dimensions.font18,
                                color: mainText,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Container(),
                          ],
                        ),
                        SizedBox(height: Dimensions.height20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on_rounded,
                                      color: mainText,
                                    ),
                                    SizedBox(width: Dimensions.width10,),
                                    Text(
                                      "${cityData!['name']}",
                                      style: TextStyle(
                                        fontSize: Dimensions.font20,
                                        fontWeight: FontWeight.w600,
                                        color: mainText
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  '${DateFormat.EEEE().format(DateTime.now())}, ${DateFormat.j().format(DateTime.now())}',
                                  style: TextStyle(
                                    fontSize: Dimensions.font16,
                                    fontWeight: FontWeight.w400,
                                    color: subText
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height50,),
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: Get.width * 0.3 ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(Dimensions.radius20),
                              color: lightBlue2,
                            ),
                            child: Image.network(
                              "https://openweathermap.org/img/wn/${dataWeather['current']['weather'][0]['icon']}@2x.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${celcius.toInt()}',
                                style: TextStyle(
                                  fontSize: Dimensions.font60,
                                  fontWeight: FontWeight.w500,
                                  color: mainText
                                ),
                              ),
                              const Text(
                                '°',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w400,
                                  color: mainText
                                ),
                              ),
                              Text(
                                'C',
                                style: TextStyle(
                                  fontSize: Dimensions.font60,
                                  fontWeight: FontWeight.w400,
                                  color: mainText
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '${dataWeather['current']['weather'][0]['main']}',
                            style: TextStyle(
                              fontSize: Dimensions.font18,
                              fontWeight: FontWeight.bold,
                              color: mainText
                            ),
                          ),
                          Text(
                            '${dataWeather['current']['weather'][0]['description']}'.toTitleCase(),
                            style: TextStyle(
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.w400,
                              color: subText
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: Dimensions.height20,),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: lightGrey,
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        border: Border.all(color: mediumBlueAlpha)
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(Dimensions.width20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Today',
                              style: TextStyle(
                                fontSize: Dimensions.font18,
                                color: mainText,
                                fontWeight: FontWeight.w500
                              ),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(height: Dimensions.height20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      'Pressure',
                                      style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: subText
                                      ),
                                    ),
                                    Text(
                                      '${dataWeather['current']['pressure']}',
                                      style: TextStyle(
                                        fontSize: Dimensions.font18,
                                        color: mainText
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Humidity',
                                      style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: subText
                                      ),
                                    ),
                                    Text(
                                      '${dataWeather['current']['humidity']}',
                                      style: TextStyle(
                                        fontSize: Dimensions.font18,
                                        color: mainText
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'Clouds',
                                      style: TextStyle(
                                        fontSize: Dimensions.font16,
                                        color: subText
                                      ),
                                    ),
                                    Text(
                                      '${dataWeather['current']['clouds']}',
                                      style: TextStyle(
                                        fontSize: Dimensions.font18,
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
                    SizedBox(height: Dimensions.height20,),
                    Text(
                      'Sunrise & Sunset',
                       style: TextStyle(
                        fontSize: Dimensions.font18,
                        color: mainText,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    SizedBox(height: Dimensions.height10,),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius10),
                        color: lightYellow,
                        border: Border.all(color: mediumBlueAlpha)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimensions.width10, horizontal: Dimensions.width20),
                        child: Row(
                          children: [
                            const Icon(Icons.wb_sunny),
                            SizedBox(width: Dimensions.width20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunrise',
                                  style: TextStyle(
                                    fontSize: Dimensions.font14,
                                    color: subText,
                                  ),
                                ),
                                Text(
                                  sunrise,
                                  style: TextStyle(
                                    fontSize: Dimensions.font22,
                                    color: mainText,
                                    fontWeight: FontWeight.w500
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Dimensions.height10,),
                    Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius10),
                        color: lightBlue3,
                        border: Border.all(color: mediumBlueAlpha)
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: Dimensions.width10, horizontal: Dimensions.width20),
                        child: Row(
                          children: [
                            const Icon(Icons.sunny_snowing),
                            SizedBox(width: Dimensions.width20,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Sunset',
                                  style: TextStyle(
                                    fontSize: Dimensions.font14,
                                    color: subText,
                                  ),
                                ),
                                Text(
                                  sunset,
                                  style: TextStyle(
                                    fontSize: Dimensions.font22,
                                    color: mainText,
                                    fontWeight: FontWeight.w500
                                  ),
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
                padding: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.width40),
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
                            Text(
                              "Today's Weather Forecast",
                              style: TextStyle(
                                fontSize: Dimensions.font18,
                                color: mainText,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                            Container(),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: Dimensions.height50,),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/nodata.jpg'
                          ),
                          Text(
                            "We're sorry :(",
                            style: TextStyle(
                              color: mainText,
                              fontSize: Dimensions.font20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Text(
                            "Data not found",
                            style: TextStyle(
                              color: subText,
                              fontSize: Dimensions.font16,
                              fontWeight: FontWeight.w400
                            ),
                          ),
                        ]
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
