import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/core/constants/app_color.dart';
import 'package:getx_clean_base/src/presentation/pages/mcredit/mcredit_dang_ky/mcredit_dang_ky_controller.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final String hintText;
  final Icon icon;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  bool enable;

  CustomInputField(
      {Key? key,
      required this.label,
      required this.hintText,
      required this.icon,
      required this.controller,
      required this.focusNode,
      required this.validator,
      required this.suffixIcon,
      this.enable = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller2 = Get.find<McreditDangKyController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade900,
              fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          validator: validator,
          enabled: enable,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: AppColor.primaryColor,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(
                  color: AppColor.secondaryColor,
                  width: 2.0,
                ),
              ),
              prefixIcon: icon,
              hintText: hintText,
              suffixIcon: suffixIcon),
          onChanged: (_) => controller2.onChange(),
        ),
      ],
    );
  }
}
