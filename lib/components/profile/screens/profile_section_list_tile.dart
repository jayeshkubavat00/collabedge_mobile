import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/contants/app_assets.dart';
import '../../../utils/contants/app_colors.dart';
import '../../../utils/contants/app_styles.dart';
import '../../../utils/responsive/responsive_helper.dart';

class ProfileSectionListTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final void Function()? onDelete;
  final void Function()? onEdit;
  const ProfileSectionListTile(
      {super.key,
      required this.title,
      required this.subTitle,
      this.onDelete,
      this.onEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: AppStyles.minimalShadow),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightBlue.withValues(alpha: 0.40),
              ),
              child: SvgPicture.asset(
                AppAssets.icCompany,
                height: ResponsiveHelper.responsiveHeight(context, 0.030),
                width: ResponsiveHelper.responsiveWidth(context, 0.030),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: ResponsiveHelper.responsiveWidth(context, 0.010)),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 0,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColors.naturalBlack,
                        fontSize:
                            ResponsiveHelper.responsiveFontSize(context, 11),
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    subTitle,
                    style: TextStyle(
                        color: AppColors.naturalBlack,
                        fontSize:
                            ResponsiveHelper.responsiveFontSize(context, 9),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            InkWell(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  AppAssets.icDelete,
                  height: ResponsiveHelper.responsiveHeight(context, 0.025),
                  width: ResponsiveHelper.responsiveWidth(context, 0.025),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: ResponsiveHelper.responsiveWidth(context, 0.005)),
            InkWell(
              child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppAssets.icEdit,
                    height: ResponsiveHelper.responsiveHeight(context, 0.025),
                    width: ResponsiveHelper.responsiveWidth(context, 0.025),
                    fit: BoxFit.cover,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
