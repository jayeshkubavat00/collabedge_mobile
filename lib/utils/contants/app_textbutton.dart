import 'package:flutter/material.dart';

import '../responsive/responsive_helper.dart';
import 'app_colors.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final VoidCallback onPressed;

  const AppTextButton(
      {super.key, required this.onPressed, required this.text, this.textStyle});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        overlayColor: Colors.transparent,
        padding: EdgeInsets.zero, // Removes padding
        splashFactory: NoSplash.splashFactory, // Removes splash effect
      ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
                color: AppColors.primaryColor1,
                fontSize: ResponsiveHelper.responsiveFontSize(context, 11),
                fontWeight: FontWeight.w500),
      ),
    );
  }
}
