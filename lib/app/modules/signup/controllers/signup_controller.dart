import 'package:flutter/material.dart';
import 'package:get/get.dart';




class SignupScreenController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final referController = TextEditingController();
  final otpController = TextEditingController();

  var showOtpField = false.obs;
  var isOtpVerified = false.obs;
  var isLoading = false.obs;

  String? _serverOtp; 

var isEmailFilled = false.obs;

void onEmailChanged(String val) {
  isEmailFilled.value = val.trim().isNotEmpty;
  showOtpField.value = false;
  isOtpVerified.value = false;
}

  // Future<void> sendOtp() async {
  //   if (emailController.text.isEmpty) {
  //     Get.snackbar("Error", "Enter a valid email");
  //     return;
  //   }

  //   try {
  //     isLoading.value = true;
  //     final  response = await dioPost(
  //       endUrl: "send-otp",
  //       data: {"email": emailController.text.trim()},
  //     );

  //     if (response.statusCode == 200) {
    
  //       if (response.data is Map && response.data["otp"] != null) {
  //         _serverOtp = response.data["otp"].toString();
  //       }

  //       showOtpField.value = true;
  //       isOtpVerified.value = false;
  //       Get.snackbar("OTP Sent", "Check your email for the OTP");
  //     } else {
  //       Get.snackbar("Error", response.data["message"] ?? "Failed to send OTP");
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }


  void verifyOtp() {
    if (_serverOtp != null &&
        otpController.text.trim() == _serverOtp.toString()) {
      isOtpVerified.value = true;
      showOtpField.value = false;
      otpController.clear();
      Get.snackbar("Success", "OTP Verified!");
    } else {
      isOtpVerified.value = false;
      Get.snackbar("Error", "Invalid OTP!");
    }
  }

  // Future<void> submitForm() async {
  //   if (!isOtpVerified.value) {
  //     Get.snackbar("Error", "Please verify OTP first!");
  //     return;
  //   }

  //   try {
  //     isLoading.value = true;
  //     final response = await dioPost(
  //       endUrl: "customer/register",
  //       data: {
  //         "name": nameController.text.trim(),
  //         "email": emailController.text.trim(),
  //         "phone": mobileController.text.trim(),
  //         "password": passwordController.text.trim(),
  //         "referral_code": referController.text.trim(),
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       Get.snackbar("Success", "Registration Successful!");
  //     Get.off((BottomNavigationBarView));
  //     } else {
  //       Get.snackbar("Error", response.data["message"] ?? "Failed to register");
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", e.toString());
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
}