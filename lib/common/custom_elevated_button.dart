import 'package:evently/core/app_styles.dart';
import 'package:flutter/material.dart';

import '../core/app_colors.dart';

class CustomElevatedButton extends StatelessWidget {
  final Color backgroundColor;
  final Color foregroundColor;
  final String text;
  final Widget? icon;
  final double? elevation;
  final void Function() onClick;

  const CustomElevatedButton({
    super.key,
    this.backgroundColor = AppColors.blue,
    this.foregroundColor = AppColors.pureWhite,
    required this.text,
    required this.onClick,
    this.icon,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: WidgetStatePropertyAll(elevation),
        padding: WidgetStatePropertyAll(EdgeInsets.all(16)),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        foregroundColor: WidgetStatePropertyAll(foregroundColor),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: AppColors.blue),
          ),
        ),
      ),
      onPressed: () {
        onClick();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) icon!,
          Text(
            text,
            style: AppStyles.textTheme.labelLarge!.copyWith(
              color: foregroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
