import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/constant/colors.dart';
import 'package:weather_app/app/constant/dimensions.dart';
import 'package:weather_app/app/modules/detail_info/controllers/detail_info_controller.dart';
import 'package:weather_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(Dimensions.width20, Dimensions.width20, Dimensions.width20, Dimensions.width10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi Ray!',
                          style: TextStyle(
                            fontSize: Dimensions.font28,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const Text(
                          "Let's explore what's going on today!"
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.radius10),
                      child: Image.asset(
                        'assets/profile.jpg',
                        height: Dimensions.height53,
                      )
                    )
                  ],
                ),
                SizedBox(height: Dimensions.height20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (value) => controller.filterCity(value),
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: subText
                            )
                          ),
                          focusColor: mainBlue,
                          prefixIcon: Icon(
                            Icons.search,
                            color: subText,
                            size: Dimensions.icon28,
                          ),
                          label: Text(
                            'Search location here',
                            style: TextStyle(
                              color: subText,
                              fontSize: Dimensions.font14
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius17)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // GetBuilder<HomeController>(
          //   builder: (value) {
              Expanded(
                child: Obx(() => ListView.builder(
                                // shrinkWrap: true,
                                // physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.foundCity.length,
                                itemBuilder: (context, index){
                              
                                  // var foundCityView = controller.foundCity;
                                  
                                  return Padding(
                                    padding: EdgeInsets.symmetric(vertical: Dimensions.width5, horizontal: Dimensions.width20),
                                    child: InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          Routes.DETAIL_INFO,
                                          arguments: controller.foundCity[index],
                                        );
                                        // final controller = Get.lazyPut<DetailInfoController>(
                                        //   () => DetailInfoController(foundCityView[index]),
                                        // );
                                        // Get.find<DetailInfoController>();
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                                        ),
                                        color: lightGrey,
                                        child: Padding(
                                          padding: EdgeInsets.all(Dimensions.width20),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                controller.foundCity[index]['name'],
                                                style: TextStyle(
                                                  color: mainText,
                                                  fontSize: Dimensions.font20,
                                                  fontWeight: FontWeight.bold
                                                ),
                                              ),
                                              Text(
                                                'See Detail Information >>',
                                                style: TextStyle(
                                                  fontSize: Dimensions.font12,
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
                              )),
              )
            // }
          // )
        ],
      )
    );
  }
}
