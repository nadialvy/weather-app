import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/services.dart' as root_bundle;
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final allCity = <Map<String, dynamic>>[].obs;
  final foundCity = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    foundCity.value = allCity;
    getLocalJson();
  }

  getLocalJson() async {
    Future<String> allDataFutureStr = root_bundle.rootBundle.loadString('models/cities.json'); //get the data
    String allDataStr = await allDataFutureStr; // convert Future<String> to String
    List<dynamic> dataCitiesOnly = json.decode(allDataStr)['data']['cities']; // convert String to List<dynamic>

    for (var element in dataCitiesOnly) {
      allCity.add(element);
    }

    foundCity.value = allCity;

    update();
    return foundCity;
  }

  void filterCity(String? cityName) async {
   var results = <Map<String, dynamic>>[];

    if(cityName == null || cityName == '' || cityName.isEmpty){
      results = allCity;
    }else {
      results = allCity
                .where((element) => element['name']
                  .toString()
                  .toLowerCase()
                  .contains(cityName.toLowerCase()))
                .toList();
    }

    foundCity.value = results;
    print(foundCity);
    update();
  }

  
}
