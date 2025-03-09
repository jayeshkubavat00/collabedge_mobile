import 'package:flutter/material.dart';
import 'package:flutter_sample/components/profile/screens/profile_education_section_widget.dart';
import 'package:flutter_sample/components/profile/screens/profile_experince_widget.dart';
import 'package:flutter_sample/components/profile/screens/profile_skills_section_widget.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

import '../../../utils/contants/app_colors.dart';
import '../../../utils/contants/app_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
                alignment: Alignment.center,
                height: ResponsiveHelper.responsiveHeight(context, 0.15),
                width: ResponsiveHelper.responsiveWidth(context, 0.25),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.redError,
                    boxShadow: AppStyles.minimalShadow)),
          ),
          Text(
            "Sarah Chen",
            style: TextStyle(
                color: AppColors.naturalBlack,
                fontSize: ResponsiveHelper.responsiveFontSize(context, 13),
                fontWeight: FontWeight.w500),
          ),
          Text(
            "Full Stack Developer | AI Enthusiast",
            style: TextStyle(
                color: AppColors.naturalBlack,
                fontSize: ResponsiveHelper.responsiveFontSize(context, 11),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: ResponsiveHelper.responsiveHeight(context, 0.05)),
          //Skills Section
          ProfileSkillsSectionWidget(),
          SizedBox(height: ResponsiveHelper.responsiveHeight(context, 0.02)),

          //Experience Section
          ProfileExperinceWidget(),
          SizedBox(height: ResponsiveHelper.responsiveHeight(context, 0.02)),

          //Experience Section
          ProfileEducationSectionWidget(),
        ],
      ),
    );
  }
}
