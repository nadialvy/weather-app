import 'package:get/get.dart';

import '../modules/detail_info/bindings/detail_info_binding.dart';
import '../modules/detail_info/views/detail_info_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_INFO,
      page: () => DetailInfoView(),
      binding: DetailInfoBinding(),
    ),
  ];
}
