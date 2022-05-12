import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/core/constants/constants.dart';
import 'package:getx_clean_base/src/presentation/pages/landing/landing_controller.dart';
import 'package:getx_clean_base/src/presentation/widgets/custom_text_button_icon.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _landingController = Get.put(LandingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcom'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(StyleConstant.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextButtonIcon(
                label: 'Go to news',
                onPress: _landingController.getToNewsPage,
                icon: Image.asset('assets/icons/news_icon.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
