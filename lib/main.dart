import 'package:demandouser/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: Size(360, 690),
      splitScreenMode: false,
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppPages.INITIAL,
        home: LoginView(),
        getPages: AppPages.routes,
      ),
    ),
  );
}
