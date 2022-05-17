import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_clean_base/src/presentation/pages/mcredit/mcredit_dang_ky/mcredit_dang_ky_controller.dart';
import 'package:getx_clean_base/src/presentation/pages/mcredit/mcredit_dang_ky/widgets/custom_input_field.dart';
import 'package:getx_clean_base/src/presentation/widgets/custom_text_button_icon.dart';

class McreditDangKy extends StatelessWidget {
  const McreditDangKy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<McreditDangKyController>();

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            if (MediaQuery.of(context).viewInsets.bottom > 0) {
              controller.unFocus();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Đăng ký tài khoản',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const FittedBox(
                    child: Text(
                      'Vui lòng cung cấp các thông tin dưới đây',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        Obx(
                          () => CustomInputField(
                            label: 'Số CMND/CCCD',
                            hintText: 'Nhập số CMND/CCCD',
                            icon: const Icon(Icons.perm_identity),
                            controller: controller.cmndController.value,
                            focusNode: controller.cmndFocusNode.value,
                            validator: controller.cmndValidator,
                            suffixIcon: controller.cmndSuffixIcon(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Obx(
                          () => CustomInputField(
                            label: 'Số điện thoại',
                            hintText: 'Nhập số điện thoại của bạn',
                            icon: const Icon(Icons.phone),
                            controller: controller.sdtController.value,
                            focusNode: controller.sdtFocusNode.value,
                            validator: controller.sdtValidator,
                            suffixIcon: controller.sdtSuffixIcon(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          //fit: FlexFit.tight,
                          height: 250,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Bạn có người giới thiệu?',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 25,
                                ),
                              ),
                              Obx(
                                () => Row(
                                  children: [
                                    Flexible(
                                      child: ListTile(
                                        title: const Text(
                                          'Tôi có',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        leading: Radio<Choice>(
                                          value: Choice.co,
                                          groupValue:
                                              controller.character.value,
                                          onChanged: (Choice? value) {
                                            controller.character.value = value!;
                                            controller.enableSdt2.value = true;
                                          },
                                        ),
                                      ),
                                    ),
                                    Flexible(
                                      child: ListTile(
                                        title: const Text(
                                          'Tôi không có',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                            fontSize: 15,
                                          ),
                                        ),
                                        leading: Radio<Choice>(
                                            value: Choice.khong,
                                            groupValue:
                                                controller.character.value,
                                            onChanged: (Choice? value) {
                                              controller.character.value =
                                                  value!;
                                              controller.enableSdt2.value =
                                                  false;
                                              controller.sdt2Controller.value
                                                  .clear();
                                            }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Obx(
                                () => CustomInputField(
                                  label: 'Số điện thoại của người giới thiệu',
                                  hintText:
                                      'Nhập số điện thoại của người giới thiệu',
                                  icon: const Icon(Icons.phone),
                                  controller: controller.sdt2Controller.value,
                                  focusNode: controller.sdt2FocusNode.value,
                                  validator: controller.sdtValidator,
                                  suffixIcon: controller.sdt2SuffixIcon(),
                                  enable: controller.enableSdt2.value,
                                ),
                              ),
                            ],
                          ),
                        ),
                        CustomTextButtonIcon(
                            label: 'Đăng ký',
                            onPress: () => controller.submit(),
                            icon: const Icon(Icons.app_registration))
                      ],
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
