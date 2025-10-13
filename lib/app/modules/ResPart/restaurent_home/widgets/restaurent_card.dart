import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantCard extends StatelessWidget {
  final Map<String, dynamic> data;
  const RestaurantCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // ✅ Safely handle banners (fallback to empty list)
    final List<String> finalBanners = (data["banners"] is List)
        ? List<String>.from(data["banners"])
        : [];

    return Container(
      margin: EdgeInsets.only(bottom: 14.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 1,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ Multiple banners scroll horizontally (or fallback image)
          SizedBox(
            height: 160.h,
            child: PageView(
              children: finalBanners.isNotEmpty
                  ? finalBanners
                      .map((img) => ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.r),
                              topRight: Radius.circular(16.r),
                            ),
                            child: Image.network(img,
                                fit: BoxFit.cover, width: double.infinity),
                          ))
                      .toList()
                  : [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                        child: Image.network(
                          "https://picsum.photos/800/400",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                    ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data["name"] ?? "Unnamed Restaurant",
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87),
                ),
                SizedBox(height: 4.h),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16.sp),
                    SizedBox(width: 3.w),
                    Text("${data["rating"] ?? "4.2"} • ",
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey.shade700)),
                    Text("${data["time"] ?? "30"} mins • ",
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey.shade700)),
                    Text("₹250–₹300 for one",
                        style: TextStyle(
                            fontSize: 12.sp, color: Colors.grey.shade700)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}