import 'package:get/get.dart';

import '../controllers/restaurent_home_controller.dart';

class RestaurentHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurentHomeController>(
      () => RestaurentHomeController(),
    );
  }
}
