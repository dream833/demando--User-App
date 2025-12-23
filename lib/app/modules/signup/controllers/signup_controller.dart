import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/config/app_config.dart';
import '../../../data/function/dio_post.dart';
import '../../bottomnavigationbar/views/bottomnavigationbar_view.dart';

class SignupScreenController extends GetxController {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  final isLoading = false.obs;

  RxBool isFormValid = false.obs;

  void checkForm() {
    isFormValid.value =
        nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        mobileController.text.isNotEmpty &&
        passwordController.text.isNotEmpty;
  }

  Future<void> register() async {
    try {
      isLoading.value = true;

      final body = {
        "name": nameController.text.trim(),
        "email": emailController.text.trim(),
        "phone": mobileController.text.trim(),
        "password": passwordController.text.trim(),
      };

      final response = await dioPost(
        endUrl: "/user-apis/user-login/user-register.php",
        data: body,
      );

      final data = response.data;

      if (data["status"] == "success" || data[response] == 200) {
        SHOW_SNACKBAR(message: "Registration successful", isSuccess: true);

        await Future.delayed(const Duration(milliseconds: 500));

        Get.offAll(() => BottomNavigationBarView());
      } else {
        SHOW_SNACKBAR(
          message: data["message"] ?? "Something went wrong",
          isSuccess: false,
        );
      }
    } catch (e) {
      SHOW_SNACKBAR(
        message: "Server error, please try again",
        isSuccess: false,
      );
      debugPrint("REGISTER ERROR 👉 $e");
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
