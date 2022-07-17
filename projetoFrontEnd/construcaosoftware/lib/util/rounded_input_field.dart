import 'package:construcaosoftware/util/constants.dart';
import 'package:construcaosoftware/util/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController ?controller;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.validator,
    this.icon = Icons.person,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFieldContainer(
      child: TextFormField(
        validator:validator,
        onChanged: onChanged,
        controller: controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
