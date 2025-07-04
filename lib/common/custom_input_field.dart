import 'package:evently/core/app_colors.dart';
import 'package:evently/core/app_styles.dart';
import 'package:evently/core/context_extition.dart';
import 'package:flutter/material.dart';

class CustomInputField extends StatefulWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? label;
  final String? hintText;
  final TextEditingController? controller;
  final bool isPassword;

  const CustomInputField({
    super.key,
    this.prefixIcon,
    this.label,
    this.controller,
    this.suffixIcon,
    this.hintText,
    this.isPassword = false,
  });

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {

  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPassword;

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration: InputDecoration(
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.isPassword? InkWell(
            onTap: (){
            setState(() {
              obscureText = !obscureText;
            });
          },
            child: Icon(obscureText? Icons.visibility_off: Icons.visibility)) :widget.suffixIcon,
        labelText: widget.label,
        hintText: widget.hintText,
        labelStyle: AppStyles.textTheme.labelMedium,
        prefixIconColor: context.tertiaryColor,
        suffixIconColor: context.tertiaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: context.tertiaryColor),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
