import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './widgets/title_check_box.dart';
import 'mcredit_seller_controller.dart';

class McreditSellerPage extends StatelessWidget {
  const McreditSellerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<McreditSellerController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kiểm tra thông tin khách hàng',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Text(
              'Khách hàng chọn loại giấy tờ tuỳ thân để thêm vào',
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 50,
            ),
            TitleCheckBox(
              title: controller.text['cccd']!,
              isCheckBox: controller.isCheckBox1,
            ),
            TitleCheckBox(
              title: controller.text['cmndm']!,
              isCheckBox: controller.isCheckBox2,
            ),
            TitleCheckBox(
              title: controller.text['cmndc']!,
              isCheckBox: controller.isCheckBox3,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 50,
              child: TextButton(
                onPressed: () {
                  controller.getIsCheckBox();
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Lưu',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
