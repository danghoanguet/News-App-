import 'package:flutter/material.dart';
import 'package:getx_clean_base/src/core/constants/app_color.dart';

class CustomTextButtonIcon extends StatelessWidget {
  final double width = double.infinity;
  final double height = 50;
  final String label;
  final Function onPress;
  final Widget icon;
  Color backgroundColor = AppColor.primaryColor;

  CustomTextButtonIcon(
      {Key? key,
      required this.label,
      required this.onPress,
      required this.icon,
      backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton.icon(
        onPressed: () => onPress(),
        icon: icon,
        label: Text(
          label,
          style: TextStyle(color: AppColor.white, fontSize: 20),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(backgroundColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          )),
        ),
      ),
    );
  }
}
