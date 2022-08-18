import 'package:get/get.dart';
import 'package:weather_app/app/modules/detail_info/controllers/detail_info_controller.dart';

class DetailInfoBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<DetailInfoController>(
      () => DetailInfoController(),
    );
  }
}
