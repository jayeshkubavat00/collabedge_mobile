import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppSystemOverlay extends StatelessWidget {
  final Widget child;
  final SystemUiOverlayStyle? overlayStyle;

  const AppSystemOverlay({
    super.key,
    required this.child,
    this.overlayStyle,
  });

  /// Default system UI style (Light Theme)
  static const SystemUiOverlayStyle defaultStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
  );

  /// Dark mode style
  static const SystemUiOverlayStyle darkStyle = SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.black,
  );

  @override
  Widget build(BuildContext context) {
    final brightness = MediaQuery.of(context).platformBrightness;
    final appliedStyle = overlayStyle ??
        (brightness == Brightness.dark ? darkStyle : defaultStyle);

    /// Ensuring the UI style is applied correctly
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SystemChrome.setSystemUIOverlayStyle(appliedStyle);
    });

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: appliedStyle,
      child: child,
    );
  }
}
