import 'package:demandouser/app/modules/CategoryFoodList/views/category_food_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class CategoryItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool small;
  const CategoryItem(
      {super.key, required this.icon, required this.title, this.small = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 👇 Navigate with category data
        Get.to(() => CategoryFoodListView(),
            arguments: {"title": title, "restaurantName": "Biryani Palace"});
      },
      child: Column(
        children: [
          Container(
            height: small ? 60.h : 75.h,
            width: small ? 60.h : 75.h,
            margin: EdgeInsets.only(right: 10.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Image.network(
                icon,
                height: small ? 30.h : 40.h,
                width: small ? 30.h : 40.h,
                errorBuilder: (_, __, ___) => const Icon(Icons.fastfood),
              ),
            ),
          ),
          SizedBox(height: 5.h),
          Text(title,
              style: TextStyle(fontSize: small ? 11.sp : 13.sp,
                  fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}