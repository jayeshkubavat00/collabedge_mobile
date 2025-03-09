import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';

class AppStyles {
  static List<BoxShadow>? minimalShadow = [
    BoxShadow(
      color: AppColors.lightBlue.withValues(alpha: 0.70),
      blurRadius: 1.0,
      spreadRadius: 1,
      offset: Offset(0.0, 0.0),
    ),
  ];
}
