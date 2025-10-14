import 'package:demandouser/app/data/widgets/shimmer.dart';
import 'package:demandouser/app/modules/ResPart/restaurent_home/widgets/banner_slider.dart';
import 'package:demandouser/app/modules/ResPart/restaurent_home/widgets/category_item.dart';
import 'package:demandouser/app/modules/ResPart/restaurent_home/widgets/restaurent_card.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/restaurent_home_controller.dart';

class RestaurentHomeView extends GetView<RestaurentHomeController> {
  const RestaurentHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RestaurentHomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 Top Row: Location + Username
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() => Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: Colors.redAccent),
                            SizedBox(width: 5.w),
                            Text(
                              controller.location.value,
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                          ],
                        )),
                    Obx(() => Text(
                          "Hi, ${controller.userName.value} 👋",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87),
                        )),
                  ],
                ),

                SizedBox(height: 16.h),

                /// 🔹 Search Bar
                Obx(() => TextField(
                      decoration: InputDecoration(
                        hintText: controller.searchHint.value,
                        hintStyle: TextStyle(fontSize: 13.sp),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.grey),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14.r),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    )),

                SizedBox(height: 18.h),

                /// 🔹 Banner Section
                const BannerSlider(),
                SizedBox(height: 20.h),

                /// 🔹 Food Categories Header + View All
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Food Categories",
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w700)),
                    TextButton(
                      onPressed: () {},
                      child: Text("View All",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.redAccent,
                              fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),

                SizedBox(height: 8.h),

                /// 🔹 Food Categories List (Horizontal)
                SizedBox(
                  height: 95.h,
                  child: Obx(() => ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.categories.length,
                        itemBuilder: (context, index) {
                          final category = controller.categories[index];
                          return Padding(
                            padding: EdgeInsets.only(right: 10.w),
                            child: CategoryItem(
                              icon: category["icon"].toString(),
                              title: category["name"].toString(),
                              small: true, // ✅ added prop for small look
                            ),
                          );
                        },
                      )),
                ),

                SizedBox(height: 18.h),

                /// 🔹 Nearby Restaurants Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nearby Restaurants",
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.w700)),
                    Text("10 restaurants found",
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey.shade600)),
                  ],
                ),

                SizedBox(height: 10.h),

                /// 🔹 Restaurant List with Shimmer Loading
                Obx(() {
                  if (controller.isLoading.value) {
                    // 👇 Show shimmer while loading
                    return buildShimmerLoader();
                  }

                  // 👇 Handle empty state
                  if (controller.restaurants.isEmpty) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 30.h),
                        child: Text(
                          "No restaurants found nearby 😔",
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    );
                  }

                  // 👇 Show restaurant list after loading
                  return Column(
                    children: controller.restaurants
                        .map((res) => RestaurantCard(data: res))
                        .toList(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}