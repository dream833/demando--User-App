import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  // Working banner images
  var banners = [
    'https://picsum.photos/400/200?random=1',
    'https://picsum.photos/400/200?random=2',
    'https://picsum.photos/400/200?random=3',
  ].obs;



  var categories = [
    {'title': 'Daily Needs', 'sub1': 'Grocery', 'sub2': 'Restaurant'},
    {'title': 'Electronics', 'sub1': 'Mobiles', 'sub2': 'Headphones'},
    {'title': 'Services', 'sub1': 'Coming Soon', 'sub2': 'Coming Soon'},
    {'title': 'Travel', 'sub1': 'Hotels', 'sub2': 'Flights'},
  ].obs;

  var featuredVendors = [
    'https://picsum.photos/400/200?random=4',
    'https://picsum.photos/400/200?random=5',
    'https://picsum.photos/400/200?random=6',
  ].obs;

  RxInt currentBannerIndex = 0.obs;
  late PageController pageController;
  Timer? bannerTimer;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.9);

    // Simulate loading
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      startAutoScroll();
    });
  }

  void startAutoScroll() {
    bannerTimer?.cancel();

    bannerTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (banners.isNotEmpty && pageController.hasClients) {
        int nextPage = (pageController.page?.round() ?? 0) + 1;
        if (nextPage >= banners.length) nextPage = 0;

        pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
        currentBannerIndex.value = nextPage;
      }
    });
  }

  @override
  void onClose() {
    bannerTimer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}