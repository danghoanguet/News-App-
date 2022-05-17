import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/core/constants/app_color.dart';

enum Choice { co, khong }

class McreditDangKyController extends GetxController {
  var cmndController = TextEditingController().obs;
  var cmndFocusNode = FocusNode().obs;
  var isCMNDEmpty = true.obs;

  var sdtController = TextEditingController().obs;
  var sdtFocusNode = FocusNode().obs;
  var isSdtEmpty = true.obs;

  var sdt2Controller = TextEditingController().obs;
  var sdt2FocusNode = FocusNode().obs;
  var isSdt2Empty = true.obs;
  var enableSdt2 = true.obs;

  var isSubmit = false.obs;

  final formKey = GlobalKey<FormState>();

  Rx<Choice> character = Choice.co.obs;

  void unFocus() {
    cmndFocusNode.value.unfocus();
    sdtFocusNode.value.unfocus();
    sdt2FocusNode.value.unfocus();
  }

  Widget? cmndSuffixIcon() {
    return (isCMNDEmpty.value == true)
        ? null
        : GestureDetector(onTap: clearCMND, child: const Icon(Icons.clear));
  }

  void clearCMND() {
    isCMNDEmpty.value = true;
    cmndController.value.clear();
  }

  Widget? sdtSuffixIcon() {
    return (isSdtEmpty.value == true)
        ? null
        : GestureDetector(onTap: clearSdt, child: const Icon(Icons.clear));
  }

  void clearSdt() {
    isSdtEmpty.value = true;
    sdtController.value.clear();
  }

  Widget? sdt2SuffixIcon() {
    return (isSdt2Empty.value == true)
        ? null
        : GestureDetector(onTap: clearSdt2, child: const Icon(Icons.clear));
  }

  void clearSdt2() {
    isSdt2Empty.value = true;
    sdt2Controller.value.clear();
  }

  void onChange() {
    if (isSubmit.value == true) {
      formKey.currentState!.validate();
      if (cmndController.value.text.isNotEmpty) {
        isCMNDEmpty.value = false;
      } else {
        isCMNDEmpty.value = true;
      }
      if (sdtController.value.text.isNotEmpty) {
        isSdtEmpty.value = false;
      } else {
        isSdtEmpty.value = true;
      }
      if (sdt2Controller.value.text.isNotEmpty) {
        isSdt2Empty.value = false;
      } else {
        isSdt2Empty.value = true;
      }
    } else {
      if (cmndController.value.text.isNotEmpty) {
        isCMNDEmpty.value = false;
      } else {
        isCMNDEmpty.value = true;
      }
      if (sdtController.value.text.isNotEmpty) {
        isSdtEmpty.value = false;
      } else {
        isSdtEmpty.value = true;
      }
      if (sdt2Controller.value.text.isNotEmpty) {
        isSdt2Empty.value = false;
      } else {
        isSdt2Empty.value = true;
      }
    }
  }

  String? Function(String?) cmndValidator = MultiValidator([
    RequiredValidator(errorText: 'CMND không được để trống'),
    MinLengthValidator(10, errorText: 'CMND cần ít nhất 10 kí tự'),
  ]);

  String? Function(String?) sdtValidator = MultiValidator([
    RequiredValidator(errorText: 'Số điện thoại không được để trống'),
    MinLengthValidator(10, errorText: 'Số điện thoại cần ít nhất 10 kí tự'),
  ]);

  void submit() {
    isSubmit.value = true;
    String res = '';
    if (formKey.currentState!.validate()) {
      res =
          'CMND: ${cmndController.value.text}\nSDT: ${sdtController.value.text}\n';
      print(
          '\nCMND: ${cmndController.value.text}\nSDT: ${sdtController.value.text} ');
      if (character.value == Choice.co) {
        res +=
            'Có người giới thiệu: Có\nSDT người giới thiệu: ${sdt2Controller.value.text}';
        print(
            '\nCó người giới thiệu: Có\nSDT người giới thiệu: ${sdt2Controller.value.text}');
      } else {
        res += 'Không có người giới thiệu';
        print('\nKhông');
      }
      if (res.isEmpty) return;
      Get.closeCurrentSnackbar();
      Get.snackbar('Thông tin của bạn', res,
          snackPosition: SnackPosition.TOP, backgroundColor: AppColor.blue);
    }
  }
}
