// File: view/login_screen.dart

import 'package:demandouser/app/modules/bottomnavigationbar/views/bottomnavigationbar_view.dart';
import 'package:demandouser/app/modules/login/controllers/login_controller.dart';
import 'package:demandouser/app/modules/login/views/commonbuttons.dart';
import 'package:demandouser/app/modules/signup/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final LoginController controller = Get.put(LoginController());

  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sign In",
              style: TextStyle(fontSize: 26.w, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.h),
            Text(
              "Please enter your login details below to start using app.",
              style: TextStyle(fontSize: 14.w, color: Colors.grey[600]),
            ),
            SizedBox(height: 30.h),
            TextField(
              controller: controller.emailController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                hintText: "Phone Number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.w),
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Obx(
              () => TextField(
                controller: controller.passwordController,
                obscureText: controller.isPasswordHidden.value,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                    onPressed: controller.togglePasswordVisibility,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.w),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ),
            ),
            SizedBox(height: 10.h),
            CommonButtons(
              title: "Sign in",

              onTap: controller.login,
              color: Colors.teal,
              textStyle: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Get.to((SignUpScreenView()));
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: Column(
                children: [
                  Text("By continuing, you agree to our"),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 4,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Terms of Service",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      Text("and"),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "Privacy Policy",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
