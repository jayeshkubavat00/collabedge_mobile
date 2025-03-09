import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

class AppTextFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final String? prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function(String)? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;

  const AppTextFormField({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.onChanged,
    this.validator,
    this.textInputAction,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4,
      children: [
        labelText.isNotEmpty
            ? Text(
                labelText,
                style: TextStyle(
                    color: AppColors.naturalBlack,
                    fontWeight: FontWeight.w500,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 10)),
              )
            : SizedBox.shrink(),
        TextFormField(
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus!.unfocus();
          },
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          validator: validator,
          cursorColor: AppColors.primaryColor1,
          textInputAction: textInputAction ?? TextInputAction.next,
          decoration: InputDecoration(
            filled: true,
            fillColor: AppColors.white,
            contentPadding: EdgeInsets.symmetric(
                vertical: ResponsiveHelper.responsiveHeight(context, 0.01),
                horizontal: ResponsiveHelper.responsiveWidth(context, 0.03)),
            hintText: hintText,
            hintStyle: TextStyle(
              color: AppColors.lightGray2,
              fontSize: ResponsiveHelper.responsiveFontSize(context, 11),
              fontWeight: FontWeight.w500,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0), // Border radius
              borderSide: BorderSide(
                color: AppColors.lightGray, // Border color
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: AppColors.primaryColor1, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.red, // Error border color
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: Colors.red, // Focused error border color
              ),
            ),
          ),
        ),
      ],
    );
  }
}
