import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final bool? resizeToAvoidBottomInset;
  const AppScaffold(
      {super.key, required this.body, this.resizeToAvoidBottomInset});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Container(
        height: ResponsiveHelper.getScreenSize(context).height,
        width: ResponsiveHelper.getScreenSize(context).width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor2,
              AppColors.primaryColor1,
            ],
          ),
        ),
        child: body,
      ),
    );
  }
}
