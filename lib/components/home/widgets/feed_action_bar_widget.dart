// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/contants/app_textbutton.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

class FeedActionBarWidget extends StatelessWidget {
  const FeedActionBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: AppTextButton(
          onPressed: () {},
          text: "Show Interest",
          textStyle: TextStyle(
              color: AppColors.darkGray,
              fontSize: ResponsiveHelper.responsiveFontSize(context, 12),
              fontWeight: FontWeight.w400),
        )),
        Container(
          height: ResponsiveHelper.responsiveHeight(context, 0.04),
          width: 1,
          color: AppColors.lightGray,
        ),
        Expanded(
            child: AppTextButton(
          onPressed: () {},
          text: "Share",
          textStyle: TextStyle(
              color: AppColors.darkGray,
              fontSize: ResponsiveHelper.responsiveFontSize(context, 12),
              fontWeight: FontWeight.w400),
        )),
      ],
    );
  }
}
