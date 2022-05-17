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
        automaticallyImplyLeading: false,
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
                icon: const Icon(
                  Icons.fiber_new_sharp,
                  color: Colors.deepOrange,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextButtonIcon(
                label: 'Go to movies',
                onPress: _landingController.getToMoviesPage,
                icon: const Icon(
                  Icons.move_to_inbox,
                  color: Colors.black87,
                ),
                backgroundColor: Colors.pink,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextButtonIcon(
                label: 'Go to Sign Up',
                onPress: _landingController.getToSignInPage,
                icon: const Icon(
                  Icons.app_registration,
                  color: Colors.red,
                ),
                backgroundColor: Colors.pink,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextButtonIcon(
                label: 'Go MCredit',
                onPress: _landingController.getToMcreditPage,
                icon: const Icon(
                  Icons.credit_card,
                  color: Colors.green,
                ),
                backgroundColor: Colors.pink,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextButtonIcon(
                label: 'Go to MCredit Sign Up',
                onPress: _landingController.getToMcreditSignUpPage,
                icon: const Icon(
                  Icons.app_registration,
                  color: Colors.yellowAccent,
                ),
                backgroundColor: Colors.pink,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
