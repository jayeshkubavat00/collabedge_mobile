import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

class AppButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double elevation;
  final double borderRadius;
  final double height; // Custom height for responsive sizing
  final bool? isLoadingState;

  const AppButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primaryColor1, // Default to primary color
    this.textColor = Colors.white, // Default text color to white
    this.elevation = 2.0, // Default elevation
    this.borderRadius = 8.0, // Default border radius
    this.height = 50.0,
    this.isLoadingState = false, // Default height
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Set the button width
      height: height, // Set the button height
      child: ElevatedButton(
        onPressed:
            isLoadingState != null && isLoadingState! ? () {} : onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(backgroundColor),
          foregroundColor: WidgetStateProperty.all(textColor),
          elevation: WidgetStateProperty.all(elevation),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          )),
        ),
        child: isLoadingState != null && isLoadingState!
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: ResponsiveHelper.responsiveWidth(context, 0.008),
                children: [
                  SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(
                      backgroundColor: AppColors.lightPink,
                      strokeCap: StrokeCap.round,
                      color: AppColors.primaryColor1,
                    ),
                  ),
                  Text(
                    "Please wait...",
                    style: TextStyle(
                        fontSize:
                            ResponsiveHelper.responsiveFontSize(context, 12),
                        fontWeight: FontWeight.w500,
                        color: AppColors.white),
                  )
                ],
              )
            : Text(
                text,
                style: TextStyle(
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 12),
                    fontWeight: FontWeight.w500,
                    color: AppColors.white),
              ),
      ),
    );
  }
}
