// Extension methods for BuildContext
import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

extension ResponsiveContext on BuildContext {
  DeviceType get deviceType => ResponsiveHelper.getDeviceType(this);
  double responsiveWidth(double percentage) =>
      ResponsiveHelper.responsiveWidth(this, percentage);
  double responsiveHeight(double percentage) =>
      ResponsiveHelper.responsiveHeight(this, percentage);
  double responsiveFontSize(double baseFontSize) =>
      ResponsiveHelper.responsiveFontSize(this, baseFontSize);
  double get aspectRatio => ResponsiveHelper.getAspectRatio(this);
  bool get isLandscape => ResponsiveHelper.isLandscape(this);
  bool get isPortrait => ResponsiveHelper.isPortrait(this);
}
