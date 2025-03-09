import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/contants/app_colors.dart';
import '../../../utils/responsive/responsive_helper.dart';

class ProfileSectionWidget extends StatelessWidget {
  final String svgUrl;
  final String title;
  const ProfileSectionWidget(
      {super.key, required this.svgUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: ResponsiveHelper.responsiveWidth(context, 0.02),
      children: [
        SvgPicture.asset(
          svgUrl,
          height: ResponsiveHelper.responsiveHeight(context, 0.030),
          width: ResponsiveHelper.responsiveWidth(context, 0.030),
          fit: BoxFit.cover,
        ),
        Text(
          title,
          style: TextStyle(
              color: AppColors.naturalBlack,
              fontSize: ResponsiveHelper.responsiveFontSize(context, 13),
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
