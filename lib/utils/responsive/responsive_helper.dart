import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, web }

class ResponsiveHelper {
  // Constants for device width thresholds
  static const double sizeForWeb = 1200;
  static const double sizeForTablet = 768;
  static const double sizeForDesktop = 1440;

  // Get screen dimensions from MediaQuery
  static Size getScreenSize(BuildContext context) =>
      MediaQuery.of(context).size;

  // Determine the device type based on screen width
  static DeviceType getDeviceType(BuildContext context) {
    double width = getScreenSize(context).width;
    if (width >= sizeForWeb) {
      return DeviceType.web;
    } else if (width >= sizeForTablet) {
      return DeviceType.tablet;
    } else {
      return DeviceType.mobile;
    }
  }

  // Check the device type with a single function
  static bool isDevice(BuildContext context, DeviceType type) {
    return getDeviceType(context) == type;
  }

  // Get responsive width based on screen width percentage
  static double responsiveWidth(BuildContext context, double percentage) {
    return getScreenSize(context).width * percentage;
  }

  // Get responsive height based on screen height percentage
  static double responsiveHeight(BuildContext context, double percentage) {
    return getScreenSize(context).height * percentage;
  }

  // Get dynamic font size based on screen width
  static double responsiveFontSize(BuildContext context, double baseFontSize) {
    double width = getScreenSize(context).width;
    if (width >= sizeForDesktop) {
      return baseFontSize * 1.3; // Increase font size for desktop
    } else if (width >= sizeForWeb) {
      return baseFontSize * 1.2; // Increase font size for web
    } else if (width >= sizeForTablet) {
      return baseFontSize * 1.1; // Slightly increase font size for tablet
    } else {
      return baseFontSize; // Default font size for mobile
    }
  }

  // Get aspect ratio of the screen
  static double getAspectRatio(BuildContext context) {
    Size size = getScreenSize(context);
    return size.width / size.height;
  }

  // Check if the device is in landscape mode
  static bool isLandscape(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.landscape;
  }

  // Check if the device is in portrait mode
  static bool isPortrait(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  static EdgeInsets responsivePadding(BuildContext context, double percentage) {
    double padding = getScreenSize(context).width * percentage;
    return EdgeInsets.all(padding);
  }

  static double responsiveWidthByDevice(BuildContext context,
      {double? mobile, double? tablet, double? web}) {
    DeviceType deviceType = getDeviceType(context);
    switch (deviceType) {
      case DeviceType.web:
        return web ?? 0.4; // Default to 40% if web is not provided
      case DeviceType.tablet:
        return tablet ?? 0.5; // Default to 50% if tablet is not provided
      case DeviceType.mobile:
        return mobile ?? 0.6; // Default to 60% if mobile is not provided
    }
  }

  static double responsiveRadius(BuildContext context,
      {double? mobile, double? tablet, double? web}) {
    DeviceType deviceType = getDeviceType(context);
    double baseRadius =
        0.05; // Default base value for the radius (5% of the width)

    switch (deviceType) {
      case DeviceType.web:
        return web ?? baseRadius * 1.5; // Slightly larger radius for web
      case DeviceType.tablet:
        return tablet ?? baseRadius * 1.2; // Medium radius for tablet
      case DeviceType.mobile:
        return mobile ?? baseRadius; // Default radius for mobile
    }
  }
}
