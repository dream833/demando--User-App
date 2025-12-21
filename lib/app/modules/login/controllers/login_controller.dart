import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/config/app_config.dart';
import '../../../data/function/dio_post.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController(text: "1111111111");
  var passwordController = TextEditingController(text: "11111111");
  var isPasswordHidden = true.obs;
  var isLoading = false.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      SHOW_SNACKBAR(message: "Please fill in all fields", isSuccess: false);
      return;
    }

    isLoading.value = true;

    try {
      var response = await dioPost(
        endUrl: "user-apis/user-login/user_login.php",
        data: {"email_or_phone": email, "password": password},
      );

      if (response.statusCode == 200 && response.data["status"] == "success") {
        String token = response.data["token"] ?? "";

        /// ✅ Only save token
        getBox.write(USER_TOKEN, token);
        getBox.write(IS_USER_LOGGED_IN, true);

        SHOW_SNACKBAR(message: "Login successful", isSuccess: true);

        // 🔥 Navigate after login
        // Get.offAllNamed(Routes.DASHBOARD);
      } else {
        SHOW_SNACKBAR(message: "Invalid login credentials", isSuccess: false);
      }
    } catch (e) {
      SHOW_SNACKBAR(message: "Something went wrong", isSuccess: false);
      log("LOGIN ERROR: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
