import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../bottomnavigationbar/views/bottomnavigationbar_view.dart';
import '../../login/views/commonbuttons.dart';
import '../controllers/signup_controller.dart';

class SignUpScreenView extends StatelessWidget {
  final controller = Get.put(SignupScreenController());

  SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: const BackButton(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'Join us today!',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
              ),
              SizedBox(height: 20.h),

              Text(
                "Owner Details",
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10.h),

              _buildTextField(
                controller.nameController,
                Icons.person,
                "Name",
                onChanged: (_) => controller.checkForm(),
              ),

              _buildTextField(
                controller.emailController,
                Icons.email,
                "E-mail",
                onChanged: (_) => controller.checkForm(),
              ),

              _buildTextField(
                controller.mobileController,
                Icons.phone,
                "Mobile Number",
                onChanged: (_) => controller.checkForm(),
              ),

              _buildTextField(
                controller.passwordController,
                Icons.lock,
                "Password",
                isObscure: true,
                onChanged: (_) => controller.checkForm(),
              ),

              SizedBox(height: 30.h),

              CommonButtons(
                title: "Join with Us",
                onTap: controller.isFormValid.value
                    ? () {
                        controller.register();
                      }
                    : null,
                color: controller.isFormValid.value
                    ? Colors.green
                    : Colors.grey,
                textStyle: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    IconData icon,
    String hint, {
    bool isObscure = false,
    Function(String)? onChanged,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: TextField(
        controller: controller,
        obscureText: isObscure,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.r)),
        ),
      ),
    );
  }
}
