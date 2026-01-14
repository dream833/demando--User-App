import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import '../../../data/config/app_config.dart';

class HomeController extends GetxController {
  var isLoading = true.obs;

  /// ================= LOCATION =================
  RxString currentAddress = "Select location".obs;
  RxBool isFetchingLocation = false.obs;

  /// ================= BANNERS =================
  var banners = [
    'https://picsum.photos/400/200?random=1',
    'https://picsum.photos/400/200?random=2',
    'https://picsum.photos/400/200?random=3',
  ].obs;

  /// ================= CATEGORIES (UNCHANGED) =================
  var categories = [
    {'title': 'Daily Needs', 'sub1': 'Grocery', 'sub2': 'Restaurant'},
    {'title': 'Electronics', 'sub1': 'Mobiles', 'sub2': 'Headphones'},
    {'title': 'Services', 'sub1': 'Coming Soon', 'sub2': 'Coming Soon'},
    {'title': 'Travel', 'sub1': 'Hotels', 'sub2': 'Flights'},
  ].obs;

  /// ================= FEATURED VENDORS =================
  var featuredVendors = [
    'https://picsum.photos/400/200?random=4',
    'https://picsum.photos/400/200?random=5',
    'https://picsum.photos/400/200?random=6',
  ].obs;

  /// ================= BANNER CONTROLLER =================
  RxInt currentBannerIndex = 0.obs;
  late PageController pageController;
  Timer? bannerTimer;

  /// ================= INIT =================
  @override
  void onInit() {
    super.onInit();
    pageController = PageController(viewportFraction: 0.9);

    /// ❌ No auto location request
    currentAddress.value = "Select location";

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      startAutoScroll();
    });
  }

  /// ================= LOCATION (USER ACTION) =================
  Future<void> getCurrentLocation() async {
    if (isFetchingLocation.value) return;

    try {
      isFetchingLocation.value = true;

      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        SHOW_SNACKBAR(
          message: "Please enable location services",
          isSuccess: false,
        );
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          SHOW_SNACKBAR(
            message: "Location permission denied",
            isSuccess: false,
          );
          return;
        }
      }

      /// 🔥 BONUS: Denied forever → open settings
      if (permission == LocationPermission.deniedForever) {
        SHOW_SNACKBAR(
          message: "Enable location from app settings",
          isSuccess: false,
        );
        await Geolocator.openAppSettings();
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        currentAddress.value = "${place.locality}, ${place.administrativeArea}";
      }
    } catch (e) {
      SHOW_SNACKBAR(message: "Unable to fetch location", isSuccess: false);
    } finally {
      isFetchingLocation.value = false;
    }
  }

  /// ================= BANNER AUTO SCROLL =================
  void startAutoScroll() {
    bannerTimer?.cancel();
    bannerTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (pageController.hasClients && banners.isNotEmpty) {
        int next = (pageController.page?.round() ?? 0) + 1;
        if (next >= banners.length) next = 0;

        pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );

        currentBannerIndex.value = next;
      }
    });
  }

  /// ================= DISPOSE =================
  @override
  void onClose() {
    bannerTimer?.cancel();
    pageController.dispose();
    super.onClose();
  }
}
