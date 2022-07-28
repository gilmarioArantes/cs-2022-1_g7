
import 'package:construcaosoftware/util/app_color.dart';
import 'package:flutter/material.dart';

class CheckIcon extends StatelessWidget {
  final bool value;
  final Color checkedColor;
  final Color uncheckedColor;
  final double size;

  const CheckIcon({Key? key, 
    this.value = true,
    this.checkedColor = AppColors.checked,
    this.uncheckedColor = AppColors.unchecked,
    this.size = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.check_circle_outline,
      color: value ? checkedColor : uncheckedColor,
      size: size,
    );
  }
}
