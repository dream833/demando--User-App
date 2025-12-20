import 'package:demandouser/app/modules/bottomnavigationbar/views/bottomnavigationbar_view.dart';
import 'package:demandouser/app/modules/login/views/commonbuttons.dart';
import 'package:demandouser/app/modules/signup/controllers/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class SignUpScreenView extends StatelessWidget {
  final  controller = Get.put(SignupScreenController());

  SignUpScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: BackButton(),
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

              /// Name
              _buildTextField(controller.nameController, Icons.person, "Name"),

              Stack(
                children: [
                  _buildTextField(
                    controller.emailController,
                    Icons.email,
                    "E-mail",
                    onChanged: controller.onEmailChanged, // ✅ new
                  ),
                  Positioned(
                    right: 10,
                    top: 15,
                    child: controller.isOtpVerified.value
                        ? Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 22.sp,
                          )
                        : const SizedBox(),
                  ),
                ],
              ),
              SizedBox(height: 5.h),

              // OTP field
              if (controller.showOtpField.value &&
                  !controller.isOtpVerified.value)
                Row(
                  children: [
                    Expanded(
                      child: _buildTextField(
                        controller.otpController,
                        Icons.lock_clock,
                        "Enter OTP",
                      ),
                    ),
                    TextButton(
                      onPressed: controller.verifyOtp,
                      child: const Text(
                        "Verify",
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
                ),

             
              if (controller.isEmailFilled.value &&
                  !controller.isOtpVerified.value &&
                  !controller.showOtpField.value)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      
                    },
                    // onPressed: controller.sendOtp,
                    child: const Text(
                      "Send OTP",
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ),

              _buildTextField(
                controller.mobileController,
                Icons.phone,
                "Mobile Number",
              ),
              _buildTextField(
                controller.passwordController,
                Icons.lock,
                "Password",
                isObscure: true,
              ),
              // _buildTextField(
              //   controller.referController,
              //   Icons.card_giftcard,
              //   "Referral Code",
              // ),

              SizedBox(height: 30.h),

              CommonButtons(
                title: "Join with Us",
                onTap: () {
                  Get.to((BottomNavigationBarView()));
                  
                },
                // onTap: controller.isOtpVerified.value
                //     ? controller.submitForm
                //     : null,
                color: controller.isOtpVerified.value
                    ? Colors.teal
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
