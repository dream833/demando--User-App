import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
var emailController = TextEditingController(text: "1111111111");
var passwordController = TextEditingController(text: "11111111");
var isPasswordHidden = true.obs;
var isLoading =false.obs;



 void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }
}
