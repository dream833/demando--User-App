import 'package:demandouser/app/modules/ResPart/restaurent_home/restaurent_details/views/restaurent_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class RestaurantCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const RestaurantCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // 👇 navigate with restaurant data
        Get.to(() => const RestaurentDetailsView(), arguments: data);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 14.h),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.vertical(top: Radius.circular(16.r)),
              child: Image.network(
                data["image"] ?? "https://via.placeholder.com/300",
                height: 160.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data["name"] ?? "Unknown Restaurant",
                      style: TextStyle(
                          fontSize: 15.sp, fontWeight: FontWeight.w600)),
                  SizedBox(height: 4.h),
                  Row(
                    children: [
                      Icon(Icons.star, size: 14.sp, color: Colors.amber),
                      SizedBox(width: 3.w),
                      Text("${data["rating"] ?? "4.3"}",
                          style: TextStyle(fontSize: 13.sp)),
                      SizedBox(width: 8.w),
                      Text("• ${data["time"] ?? "25-30 min"}",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.grey)),
                      SizedBox(width: 8.w),
                      Text("• ₹${data["price"] ?? "250-300"} for one",
                          style:
                              TextStyle(fontSize: 12.sp, color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}