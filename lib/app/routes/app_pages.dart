import 'package:get/get.dart';

import '../modules/CategoryFoodList/bindings/category_food_list_binding.dart';
import '../modules/CategoryFoodList/views/category_food_list_view.dart';
import '../modules/ResPart/restaurent_home/bindings/restaurent_home_binding.dart';
import '../modules/ResPart/restaurent_home/restaurent_details/bindings/restaurent_details_binding.dart';
import '../modules/ResPart/restaurent_home/restaurent_details/views/restaurent_details_view.dart';
import '../modules/ResPart/restaurent_home/views/restaurent_home_view.dart';
import '../modules/bottomnavigationbar/bindings/bottomnavigationbar_binding.dart';
import '../modules/bottomnavigationbar/views/bottomnavigationbar_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/otppage/bindings/otppage_binding.dart';
import '../modules/otppage/views/otppage_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignUpScreenView(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: _Paths.OTPPAGE,
      page: () => const OtppageView(),
      binding: OtppageBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOMNAVIGATIONBAR,
      page: () => BottomNavigationBarView(),
      binding: BottomnavigationbarBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURENT_HOME,
      page: () => const RestaurentHomeView(),
      binding: RestaurentHomeBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURENT_DETAILS,
      page: () => const RestaurentDetailsView(),
      binding: RestaurentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.CATEGORY_FOOD_LIST,
      page: () => const CategoryFoodListView(),
      binding: CategoryFoodListBinding(),
    ),
  ];
}
