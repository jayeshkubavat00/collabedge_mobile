import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_assets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../utils/contants/app_colors.dart';
import '../../../utils/contants/app_styles.dart';
import '../../../utils/responsive/responsive_helper.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
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
            SvgPicture.asset(
              AppAssets.icActiveNotification,
              height: 25,
              width: 25,
              fit: BoxFit.cover,
            ),
            SizedBox(width: ResponsiveHelper.responsiveWidth(context, 0.010)),
            Expanded(
              child: Text(
                "Showing interest in the right context can make all the difference. It helps build stronger connections and meaningful conversations!",
                style: TextStyle(
                    color: AppColors.naturalBlack,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 12),
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
    );
  }
}
