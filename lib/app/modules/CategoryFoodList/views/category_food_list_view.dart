import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryFoodListView extends StatelessWidget {
  const CategoryFoodListView({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments ?? {};
    final title = args["title"] ?? "Foods";
    final restaurantName = args["restaurantName"] ?? "Restaurant";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        title: Text("$title - $restaurantName"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Available $title items",
                style:
                    TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700)),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView(
                children: [
                  foodTile("Special Chicken Biryani", "₹180"),
                  foodTile("Mutton Biryani", "₹220"),
                  foodTile("Egg Biryani", "₹150"),
                  foodTile("Paneer Biryani", "₹210"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget foodTile(String name, String price) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          Container(
            height: 55.h,
            width: 55.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: const DecorationImage(
                image: NetworkImage("https://via.placeholder.com/80"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style:
                        TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600)),
                Text(price,
                    style:
                        TextStyle(fontSize: 13.sp, color: Colors.redAccent)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}