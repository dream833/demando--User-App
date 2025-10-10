import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading =false.obs;
  var banners = [
    'https://images.unsplash.com/photo-1612832021029-91b6b0038d2b',
    'https://images.unsplash.com/photo-1606813902913-c3d36c692bba',
    'https://images.unsplash.com/photo-1611095564984-59f97a37b23a',
  ].obs;

  var quickActions = [
    {'icon': '💳', 'label': 'Pay bills'},
    {'icon': '📱', 'label': 'Recharge'},
    {'icon': '💰', 'label': 'Loans'},
    {'icon': '📈', 'label': 'Invest'},
    {'icon': '🏦', 'label': 'Bank'},
  ].obs;

  var categories = [
    {'title': 'Daily Needs', 'sub1': 'Grocery', 'sub2': 'Restaurent'},
    {'title': 'Electronics', 'sub1': 'Mobiles', 'sub2': 'Headphones'},
    {'title': 'Services', 'sub1': 'Coming Soon', 'sub2': 'Coming Soon'},
    {'title': 'Travel', 'sub1': 'Hotels', 'sub2': 'Flights'},
  ].obs;

  var featuredVendors = [
    'https://images.unsplash.com/photo-1612832021029-91b6b0038d2b',
    'https://images.unsplash.com/photo-1606813902913-c3d36c692bba',
    'https://images.unsplash.com/photo-1611095564984-59f97a37b23a',
  ].obs;

  RxInt currentBannerIndex = 0.obs;
  PageController? pageController;
  Timer? bannerTimer;

  @override
  void onInit() {
    super.onInit();
      pageController = PageController(viewportFraction: 0.9);

  Future.delayed(const Duration(seconds: 2), () {
    isLoading.value = false;
    startAutoScroll();
  });
    pageController = PageController(viewportFraction: 0.9);
    startAutoScroll();
  }

  void startAutoScroll() {
    bannerTimer?.cancel(); // Prevent multiple timers

    bannerTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (banners.isNotEmpty && pageController != null && pageController!.hasClients) {
        int nextPage = ((pageController!.page?.round()) ?? 0) + 1;
        if (nextPage >= banners.length) nextPage = 0;
        pageController!.animateToPage(
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
    pageController?.dispose();
    super.onClose();
  }
}