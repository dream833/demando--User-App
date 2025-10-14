import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/restaurent_details_controller.dart';

class RestaurentDetailsView extends GetView<RestaurentDetailsController> {
  const RestaurentDetailsView({super.key});

         @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? {};
    final name = data["name"] ?? "Restaurant Name";
    final image = data["image"] ?? "https://via.placeholder.com/400";
    final rating = data["rating"] ?? "4.5";
    final time = data["time"] ?? "25-30 min";
    final description = data["description"] ??
        "Delicious meals prepared fresh and served with love!";

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          // Open Cart
          // Get.to(() => const CartView());
        },
        icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
        label: const Text("View Cart"),
      ),
      body: CustomScrollView(
        slivers: [
          /// 🔹 Hero Banner
          SliverAppBar(
            pinned: true,
            expandedHeight: 230.h,
            backgroundColor: Colors.redAccent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(image, fit: BoxFit.cover),
                  Container(
                    color: Colors.black.withOpacity(0.35),
                  ),
                  Positioned(
                    bottom: 20.h,
                    left: 16.w,
                    right: 16.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700)),
                        SizedBox(height: 4.h),
                        Row(
                          children: [
                            const Icon(Icons.star,
                                color: Colors.amber, size: 16),
                            SizedBox(width: 4.w),
                            Text("$rating • $time",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 13.sp)),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          /// 🔹 Body
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(description,
                      style:
                          TextStyle(fontSize: 14.sp, color: Colors.grey[700])),
                  SizedBox(height: 20.h),

                  /// Section Title
                  Text("Popular Dishes",
                      style: TextStyle(
                          fontSize: 18.sp, fontWeight: FontWeight.w700)),
                  SizedBox(height: 12.h),

                  /// Popular Dishes List
                  Column(
                    children: [
                      dishTile("Chicken Biryani", "₹180", "4.5"),
                      dishTile("Paneer Butter Masala", "₹220", "4.3"),
                      dishTile("Tandoori Roti", "₹25", "4.8"),
                      dishTile("Mutton Curry", "₹280", "4.6"),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  /// 🔹 Food item widget with Add to Cart button
  Widget dishTile(String name, String price, String rating) {
    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: Image.network(
              "https://via.placeholder.com/100",
              height: 60.h,
              width: 60.h,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(
                        fontSize: 15.sp, fontWeight: FontWeight.w600)),
                Text(price,
                    style: TextStyle(
                        fontSize: 13.sp, color: Colors.redAccent)),
              ],
            ),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.star, size: 14, color: Colors.amber),
                  SizedBox(width: 4.w),
                  Text(rating,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey[700]))
                ],
              ),
              SizedBox(height: 6.h),
              InkWell(
                onTap: () {
                  // 👇 Add to Cart Logic
                  Get.snackbar("Added", "$name added to cart!",
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white);
                },
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text("Add",
                      style: TextStyle(color: Colors.white, fontSize: 13.sp)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}