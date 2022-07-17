import 'package:construcaosoftware/util/constants.dart';
import 'package:construcaosoftware/util/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController ?controller;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyBoardType;

  const RoundedInputField({
    Key? key,
    this.hintText,
    this.validator,
    this.icon = Icons.person,
    this.controller,
    this.inputFormatters,
    this.keyBoardType,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return TextFieldContainer(
      child: TextFormField(
        validator:validator,
        onChanged: onChanged,
        keyboardType: keyBoardType,
          inputFormatters: inputFormatters,
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
