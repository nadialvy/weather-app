import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/constant/colors.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: mainBlue,
      ),
      debugShowCheckedModeBanner: false,
      title: "Weather App",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    ),
  );
}
