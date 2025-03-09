import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter_svg/svg.dart'; // Make sure this is set for your color constants

// Toast Function

void appToast(
    {required String icon,
    required ToastStatus status,
    required String msg,
    required BuildContext context}) {
  showToastWidget(AppToastMessage(iconPath: icon, status: status, msg: msg),
      context: context,
      animation: StyledToastAnimation.slideFromTop,
      reverseAnimation: StyledToastAnimation.slideToTop,
      position: StyledToastPosition.top,
      startOffset: Offset(0.0, -3.0),
      reverseEndOffset: Offset(0.0, -3.0),
      duration: Duration(seconds: 4),
      animDuration: Duration(seconds: 1),
      curve: Curves.elasticOut,
      reverseCurve: Curves.fastOutSlowIn);
}

// Enum for Toast Status
enum ToastStatus {
  success,
  error,
  failed,
}

class AppToastMessage extends StatelessWidget {
  final String msg;
  final String iconPath;
  final ToastStatus status; // Accepts status as parameter
  final double? width;

  const AppToastMessage(
      {super.key,
      required this.status,
      required this.msg,
      this.width,
      required this.iconPath});

  @override
  Widget build(BuildContext context) {
    Color borderColor;

    // Set the color based on the ToastStatus
    switch (status) {
      case ToastStatus.success:
        borderColor = AppColors.primaryColor1;
        break;
      case ToastStatus.error:
        borderColor = AppColors.redError;
        break;
      case ToastStatus.failed:
        borderColor = AppColors.lightPink; // Adjust with appropriate color
        break;
    }

    return Container(
      width: width,
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
        ),
        border: Border(
          left: BorderSide(color: borderColor, width: 4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  height: ResponsiveHelper.responsiveHeight(context, 0.035),
                  width: ResponsiveHelper.responsiveWidth(context, 0.035),
                ),
                SizedBox(
                  width: ResponsiveHelper.responsiveWidth(context, 0.005),
                ),
                Text(
                  msg,
                  style: TextStyle(
                    color: borderColor,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 10),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  ToastManager().dismissAll(showAnim: true);
                },
                icon: Icon(Icons.close))
          ],
        ),
      ),
    );
  }
}
