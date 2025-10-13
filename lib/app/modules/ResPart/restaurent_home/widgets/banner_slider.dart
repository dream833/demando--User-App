import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({super.key});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final CarouselSliderController _controller = CarouselSliderController(); // ✅ Updated name
  int _current = 0;

  final List<String> banners = [
    "https://picsum.photos/800/300?1",
    "https://picsum.photos/800/300?2",
    "https://picsum.photos/800/300?3",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          // controller: _controller, // ✅ new param name
          options: CarouselOptions(
            height: 120.h,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            onPageChanged: (index, reason) {
              setState(() => _current = index);
            },
          ),
          items: banners.map((img) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(14.r),
              child: Image.network(img,
                  fit: BoxFit.cover, width: double.infinity),
            );
          }).toList(),
        ),
        SizedBox(height: 8.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: banners.asMap().entries.map((entry) {
            bool isActive = _current == entry.key;
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4.w),
                width: isActive ? 10.w : 6.w,
                height: 6.w,
                decoration: BoxDecoration(
                  color: isActive ? Colors.redAccent : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(3.r),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}