import 'package:flutter/material.dart';

import '../../utils/contants/app_colors.dart';
import '../../utils/responsive/responsive_helper.dart';

class AppLogoTextWidget extends StatelessWidget {
  const AppLogoTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Connectly",
      style: TextStyle(
          letterSpacing: 2,
          color: AppColors.primaryColor1,
          fontWeight: FontWeight.w700,
          fontSize: ResponsiveHelper.responsiveFontSize(context, 15)),
    );
  }
}
