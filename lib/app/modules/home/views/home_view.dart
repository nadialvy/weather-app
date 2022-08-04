// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/constant/colors.dart';
import 'package:weather_app/app/modules/detail_info/controllers/detail_info_controller.dart';
import 'package:weather_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBlue,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: lightesBlue
                  )
                ),
                focusColor: mainBlue,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                label: Text(
                  'Search...',
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          
          FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('models/cities.json'),
            builder: ((context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              var allData = json.decode(snapshot.data.toString());
              var citiesOnly = allData['data']['cities'];

              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: citiesOnly.length,
                itemBuilder: (context, index){

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.DETAIL_INFO,
                          arguments: citiesOnly[index],
                        );

                        final controller = Get.lazyPut<DetailInfoController>(
                                            () => DetailInfoController(citiesOnly[index]),
                                          );
                        Get.find<DetailInfoController>();
                      },
                      child: Card(
                        color: lightesBlue,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${citiesOnly[index]['name']}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              Text(
                                'See Detail Information >>',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: mainBlue
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }
              );
            })
          )
        ],
      )
    );
  }
}
