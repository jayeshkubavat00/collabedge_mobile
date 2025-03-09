import 'package:flutter/material.dart';

import '../../../utils/contants/app_colors.dart';
import '../../../utils/contants/app_styles.dart';
import '../../../utils/responsive/responsive_helper.dart';

class ChatListTile extends StatelessWidget {
  const ChatListTile({super.key});

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
            Image.network(
              "https://avatar.iran.liara.run/public/1s",
              alignment: Alignment.center,
              width: 35,
              height: 35,
            ),
            SizedBox(width: ResponsiveHelper.responsiveWidth(context, 0.010)),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 1,
              children: [
                Text(
                  "Sarah Chen",
                  style: TextStyle(
                      color: AppColors.naturalBlack,
                      fontSize:
                          ResponsiveHelper.responsiveFontSize(context, 11),
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  "Full Stack Developer | AI Enthusiast",
                  style: TextStyle(
                      color: AppColors.naturalBlack,
                      fontSize: ResponsiveHelper.responsiveFontSize(context, 9),
                      fontWeight: FontWeight.w400),
                ),
              ],
            )
          ],
        ),
      ),
    );
 
  }
}
