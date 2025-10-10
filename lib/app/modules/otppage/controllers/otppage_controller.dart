import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OtppageController extends GetxController {
  var email = "".obs;

  // OTP related
  var otp = "".obs;
  var isButtonEnabled = false.obs;
  var isVerifying = false.obs;


  var remainingTime = "00:30".obs;
  var canResend = false.obs;
  Timer? _timer;
  int seconds = 30;

  @override
  void onInit() {
    super.onInit();
    startTimer(); 
  }

  /// Start / Restart Timer
  void startTimer() {
    
    seconds = 30;
    canResend.value = false;
    updateRemainingTime();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        updateRemainingTime();
      } else {
        canResend.value = true;
        _timer?.cancel();
      }
    });
  }

  /// Update remaining time string
  void updateRemainingTime() {
    final m = (seconds ~/ 60).toString().padLeft(2, '0');
    final s = (seconds % 60).toString().padLeft(2, '0');
    remainingTime.value = "$m:$s";
  }

  /// Resend OTP
  void resendOtp() {
    if (canResend.value) {
      // 🔄 Simulate API call
      Get.snackbar(
        "OTP Sent",
        "A new OTP has been sent to your email",
        backgroundColor: Colors.teal,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
      );

      startTimer(); // restart timer
    }
  }

  /// OTP Change
  void onOtpChanged(String value) {
    otp.value = value;
    isButtonEnabled.value = value.length == 4;
  }

  /// Verify OTP
  void verifyOtp() async {
    isVerifying.value = true;

    await Future.delayed(const Duration(seconds: 1)); // simulate API call

    if (otp.value == "1234") {
      // ✅ Success
      isVerifying.value = false;
      Get.snackbar(
        "Success",
        "OTP Verified Successfully 🎉",
        backgroundColor: Colors.teal,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
      );

      // Navigate to Home Page
      Get.offAllNamed("/bottomnavigationbar");
    } else {
      // ❌ Wrong OTP
      isVerifying.value = false;
      Get.snackbar(
        "Error",
        "Wrong OTP. Please try again.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(12),
        borderRadius: 12,
      );
    }
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}