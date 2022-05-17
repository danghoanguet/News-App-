import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mcredit_seller_controller.dart';

class TitleCheckBox extends StatelessWidget {
  final String title;
  Rx<bool> isCheckBox;
  TitleCheckBox({Key? key, required this.title, required this.isCheckBox})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<McreditSellerController>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        Obx(
          () => Checkbox(
            checkColor: Colors.white,

            // fillColor: MaterialStateProperty.resolveWith(controller.getColor),
            value: isCheckBox.value,
            onChanged: (bool? value) {
              // controller.checkBox(isCheckBox.obs, value!);
              // print('$isCheckBox');
              isCheckBox.value = value!;
            },
          ),
        ),
      ],
    );
  }
}
