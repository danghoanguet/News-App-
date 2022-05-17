import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/presentation/app_routes.dart';
import 'package:getx_clean_base/src/presentation/pages/landing/landing_page.dart';
import 'package:getx_clean_base/src/presentation/pages/mcredit/mcredit_dang_ky/mcredit_dang_ky_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then((value) {
      // Get.offNamed(AppRoutes.mcreditDangky);
      Get.to(() => const LandingPage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "W2E",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                letterSpacing: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
