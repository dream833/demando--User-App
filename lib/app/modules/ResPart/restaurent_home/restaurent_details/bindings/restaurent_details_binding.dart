import 'package:get/get.dart';

import '../controllers/restaurent_details_controller.dart';

class RestaurentDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurentDetailsController>(
      () => RestaurentDetailsController(),
    );
  }
}
