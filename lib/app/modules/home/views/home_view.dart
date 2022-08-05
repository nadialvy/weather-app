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
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hi Ray!',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "Let's explore what's going on today!"
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/profile.jpg',
                        height: 53,
                      )
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) => controller.filterCity(value),
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: subText
                            )
                          ),
                          focusColor: mainBlue,
                          prefixIcon: Icon(
                            Icons.search,
                            color: subText,
                            size: 28,
                          ),
                          label: Text(
                            'Search location here',
                            style: TextStyle(
                              color: subText,
                              fontSize: 14
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(17.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        color: lightGrey,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                foundCityView[index]['name'],
                                style: const TextStyle(
                                  color: mainText,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                              const Text(
                                'See Detail Information >>',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: subText
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
