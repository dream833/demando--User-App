import 'package:get/get.dart';

import '../controllers/category_food_list_controller.dart';

class CategoryFoodListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryFoodListController>(
      () => CategoryFoodListController(),
    );
  }
}
