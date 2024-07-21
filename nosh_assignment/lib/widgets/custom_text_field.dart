import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nosh_assignment/app/theme/app_color.dart';
import 'package:nosh_assignment/app/theme/styles.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final double? height;
  final int? maxLength;
  final int? maxLine;
  final TextInputType inputType;
  final TextEditingController controller;
  final bool isEnabled;
  final Color? fieldColor;
  final bool obscureText;
  final Widget? prefixWidget;
  final EdgeInsetsGeometry? contentPadding;
  final Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText = '',
    this.maxLength,
    this.fieldColor,
    this.maxLine = 1,
    this.height,
    this.inputType = TextInputType.text,
    this.isEnabled = true,
    this.obscureText = false,
    this.prefixWidget,
    this.contentPadding,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        controller: controller,
        keyboardType: inputType,
        decoration: InputDecoration(
          prefixIcon: prefixWidget,
          isDense: true,
          fillColor: AppColors.white,
          filled: true,
          hintText: hintText.capitalize,
          labelText: hintText.capitalize,
          floatingLabelStyle: Styles.tsBlackRegular14,
          enabled: isEnabled,
          contentPadding: contentPadding,
          focusedErrorBorder: commonInputBorder(),
          errorBorder: commonInputBorder(),
          border: commonInputBorder(),
          enabledBorder: commonInputBorder(),
          disabledBorder: commonInputBorder(),
          focusedBorder: commonInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }

  OutlineInputBorder commonInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: AppColors.white),
      borderRadius: BorderRadius.circular(8.0),
    );
  }
}
