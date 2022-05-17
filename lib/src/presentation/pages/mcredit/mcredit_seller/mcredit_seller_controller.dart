import 'package:flutter/material.dart';
import 'package:get/get.dart';

class McreditSellerController extends GetxController {
  var isCheckBox1 = false.obs;
  var isCheckBox2 = false.obs;
  var isCheckBox3 = false.obs;

  final Map<String, String> text = const {
    'cccd': 'Căn cước công dân',
    'cmndm': 'Chứng minh nhân dân bản mới',
    'cmndc': 'Chứng minh nhân dân bản cũ',
  };

  void checkBox(Rx<bool> isCheckBox, bool value) {
    isCheckBox.value = value;
  }

  void getIsCheckBox() {
    String res = '';
    if (isCheckBox1.value == true) {
      res = '${text['cccd']!}\n';
    }

    if (isCheckBox2.value == true) {
      res += '${text['cmndm']!}\n';
    }

    if (isCheckBox3.value == true) {
      res += '${text['cmndc']!}';
    }
    if (res.isEmpty) return;
    Get.closeCurrentSnackbar();
    Get.snackbar(
      "Bạn chọn",
      res,
      icon: const Icon(Icons.person, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
    );
  }

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }
}
