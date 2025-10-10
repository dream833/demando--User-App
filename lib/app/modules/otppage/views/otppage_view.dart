import 'package:demandouser/app/modules/otppage/controllers/otppage_controller.dart';
import 'package:demandouser/app/modules/signup/views/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class OtppageView extends GetView<OtppageController> {
  const OtppageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Container(
              padding: EdgeInsets.all(24.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24.r),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
          
                  Text(
                    "Enter the OTP",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24.sp,
                    ),
                  ),
                  SizedBox(height: 8.h),

               
                  Obx(
                    () => Text.rich(
                      TextSpan(
                        text: 'Email sent to  test@gmail.com',
                        children: [
                          TextSpan(
                            text: controller.email.value,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // 🔢 OTP Input
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    onChanged: controller.onOtpChanged,
                    keyboardType: TextInputType.number,
                    autoFocus: true,
                    pinTheme: PinTheme(
                      activeColor: Colors.teal,
                      selectedColor: Colors.teal,
                      inactiveColor: Colors.grey,
                      borderRadius: BorderRadius.circular(8.r),
                      shape: PinCodeFieldShape.box,
                      fieldHeight: 41.h,
                      fieldWidth: 55.w,
                    ),
                  ),
                  SizedBox(height: 20.h),

                  // ⏱ Timer + Resend
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          controller
                              .remainingTime
                              .value, 
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: controller.canResend.value
                              ? controller.resendOtp
                              : null,
                          child: Text(
                            "Resend",
                            style: TextStyle(
                              color: controller.canResend.value
                                  ? Colors.teal
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 32.h),

                  // ✅ Verify Button
                  Obx(
                    () => ElevatedButton(
                      onPressed:
                          controller.isButtonEnabled.value &&
                              !controller.isVerifying.value
                          ? controller.verifyOtp
                          : null,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50.h),
                        backgroundColor: controller.isButtonEnabled.value
                            ? Colors.teal
                            : Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Complete Verification",
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.arrow_forward, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),

                  // ↩ Wrong Email
                  Center(
                    child: GestureDetector(
                      onTap: () => Get.to(() => SignUpScreenView()),
                      child: RichText(
                        text: const TextSpan(
                          text: 'Wrong Email? ',
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Go Back',
                              style: TextStyle(color: Colors.teal),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
