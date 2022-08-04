import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailInfoController extends GetxController {
  late final Map<String, dynamic> cityData; //get data from user's click
  DetailInfoController (this.cityData);

  @override
  void onInit() {
    super.onInit();
  }


  Stream<Map<String, dynamic>> getWeather() async* {
    print(cityData);
    var dataLatitude = cityData['latitude'];
    var dataLongitude = cityData['longitude'];

    if(dataLatitude != "" && dataLongitude != ""){
      try{
        var resp = await http.get(
          Uri.parse('https://api.openweathermap.org/data/2.5/onecall?lat=$dataLatitude&lon=$dataLongitude&appid=43ea6baaad7663dc17637e22ee6f78f2')
        );
        Map<String, dynamic> weatherMap = json.decode(resp.body);
        yield weatherMap;
      }catch (e){
        print(e);
      }
    }
  }
}
