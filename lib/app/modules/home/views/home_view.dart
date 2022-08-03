// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:weather_app/app/constant/colors.dart';
import 'package:weather_app/app/entities/cities_model.dart';

import '../controllers/home_controller.dart';
import 'package:dio/dio.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightesBlue,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: mainBlue
                  )
                ),
                focusColor: mainBlue,
                prefixIcon: Icon(
                  Icons.search,
                  color: mainBlue,
                ),
                label: Text(
                  'Search...',
                  style: TextStyle(
                    color: mainBlue
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
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${citiesOnly[index]['name']}',
                              style: TextStyle(
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
