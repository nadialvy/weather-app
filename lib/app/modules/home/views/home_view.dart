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
              onChanged: (value) => controller.filterCity(value),
              decoration: const InputDecoration(
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
                  style: TextStyle(color: Colors.white),
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),

          GetBuilder<HomeController>(
            builder: (value) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.foundCity.length,
                itemBuilder: (context, index){
              
                  var foundCityView = controller.foundCity;
                  // print('PRINT DARI VIEW = ${controller.foundCity[0]}');
                    
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          Routes.DETAIL_INFO,
                          arguments: foundCityView[index],
                        );
                        final controller = Get.lazyPut<DetailInfoController>(
                          () => DetailInfoController(foundCityView[index]),
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
                                foundCityView[index]['name'],
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const Text(
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
            }
          )
        ],
      )
    );
  }
}
