import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool small;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    this.small = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: small ? 70.w : 90.w,
      margin: EdgeInsets.only(right: 8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            blurRadius: 6,
            spreadRadius: 2,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(icon, height: small ? 35.h : 45.h, width: small ? 35.w : 45.w),
          SizedBox(height: 6.h),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: small ? 11.sp : 13.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}