import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailInfoController extends GetxController {
  // late final Map<String, dynamic> cityData; //get data from user's click
  // DetailInfoController (this.cityData);
  Map<String, dynamic>? cityData = Get.arguments;

  @override
  void onInit() {
    super.onInit();
  }

  Stream<Map<String, dynamic>> getWeather() async* {
    Map<String, dynamic> weatherMap = {};
    var dataLatitude = cityData!['latitude'];
    var dataLongitude = cityData!['longitude'];

    if(dataLatitude != "" && dataLongitude != ""){
      try{
        var resp = await http.get(
          Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$dataLatitude&lon=$dataLongitude&appid=43ea6baaad7663dc17637e22ee6f78f2')
        );
        weatherMap = json.decode(resp.body);
        yield weatherMap;
      }catch (e){
        yield weatherMap = {
          "message" : "No latitude/longitude found."
        };
      }
    }else {
      yield {"message" : "No latitude/longitude found."};
    }
  }
}
