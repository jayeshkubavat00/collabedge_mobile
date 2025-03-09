import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/components/authentication/data/forget_bloc/forget_bloc.dart';
import 'package:flutter_sample/components/authentication/screens/two_factor_screen.dart';
import 'package:flutter_sample/shared/common_widgets/app_button.dart';
import 'package:flutter_sample/shared/common_widgets/app_textform_field.dart';
import 'package:flutter_sample/shared/common_widgets/app_toast_message.dart';
import 'package:flutter_sample/utils/contants/app_assets.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/contants/app_string.dart';
import 'package:flutter_sample/utils/contants/app_textbutton.dart';
import 'package:flutter_sample/utils/contants/app_validator.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/common_widgets/app_system_overlay_widget.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppSystemOverlay(
      overlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.white),
      child: BlocProvider(
        create: (context) => ForgetBloc(),
        child: Scaffold(
          backgroundColor: AppColors.white,
          body: SafeArea(
            child: BlocListener<ForgetBloc, ForgetState>(
              listener: (context, state) {
                if (state is ForgetSuccess) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => TwoFactorScreen(),
                      ));
                }
                if (state is ForgetFailure) {
                  appToast(
                    icon: AppAssets.icWarning,
                    status: ToastStatus.error,
                    msg: AppString.invalidEmail,
                    // ignore: use_build_context_synchronously
                    context: context,
                  );
                }
              },
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlocBuilder<ForgetBloc, ForgetState>(
                        builder: (context, state) {
                          final bloc = context.read<ForgetBloc>();
                          return Form(
                            key: bloc.formKey,
                            child: Container(
                              padding: EdgeInsets.all(10),
                              color: AppColors.white,
                              width: ResponsiveHelper.responsiveWidthByDevice(
                                    context,
                                    mobile: 0.9,
                                    tablet: 0.7,
                                    web: 0.4,
                                  ) *
                                  ResponsiveHelper.getScreenSize(context).width,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    icon: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: AppColors
                                            .lightGray3, // Background color
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.keyboard_arrow_left_rounded,
                                        color: AppColors.naturalBlack,
                                        size: ResponsiveHelper.responsiveHeight(
                                            context, 0.030),
                                      ),
                                    ),
                                    iconSize: ResponsiveHelper.responsiveHeight(
                                        context, 0.05),
                                  ),
                                  SizedBox(
                                    height: ResponsiveHelper.responsiveHeight(
                                        context, 0.030),
                                  ),
                                  Center(
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                        color: AppColors
                                            .lightBlue, // Background color
                                        shape: BoxShape.circle,
                                      ),
                                      child: SvgPicture.asset(
                                        AppAssets.icLock,
                                        fit: BoxFit.contain,
                                        height:
                                            ResponsiveHelper.responsiveHeight(
                                                context, 0.030),
                                        width: ResponsiveHelper.responsiveWidth(
                                            context, 0.030),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ResponsiveHelper.responsiveHeight(
                                        context, 0.020),
                                  ),
                                  Center(
                                    child: Text(
                                      AppString.forgotPassword,
                                      style: TextStyle(
                                          fontSize: ResponsiveHelper
                                              .responsiveFontSize(context, 15),
                                          color: AppColors.naturalBlack,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ResponsiveHelper.responsiveHeight(
                                        context, 0.005),
                                  ),
                                  Center(
                                    child: Text(
                                      AppString.noWorries,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: ResponsiveHelper
                                              .responsiveFontSize(context, 10),
                                          color: AppColors.naturalBlack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                    height: ResponsiveHelper.responsiveHeight(
                                        context, 0.030),
                                  ),
                                  AppTextFormField(
                                      labelText: AppString.emailAddress,
                                      validator: AppValidator.validateEmail,
                                      hintText: AppString.enterYourEmail,
                                      controller: bloc.emailController),
                                  SizedBox(
                                    height: ResponsiveHelper.responsiveHeight(
                                        context, 0.030),
                                  ),
                                  AppButton(
                                    isLoadingState: state is ForgetLoading,
                                    text: AppString.sendResetInstructions,
                                    onPressed: () {
                                      bloc.add(ForgetSubmittedEvent());
                                    },
                                  ),
                                  SizedBox(
                                      height: ResponsiveHelper.responsiveHeight(
                                          context, 0.030)),
                                  Center(
                                    child: AppTextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      text: AppString.backToLogin,
                                      textStyle: TextStyle(
                                          fontSize: ResponsiveHelper
                                              .responsiveFontSize(context, 10),
                                          color: AppColors.naturalBlack,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  SizedBox(
                                      height: ResponsiveHelper.responsiveHeight(
                                          context, 0.010)),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppString.needHelp,
                                        style: TextStyle(
                                            fontSize: ResponsiveHelper
                                                .responsiveFontSize(
                                                    context, 10),
                                            color: AppColors.naturalBlack,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      AppTextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: AppString.contactSupport,
                                        textStyle: TextStyle(
                                            fontSize: ResponsiveHelper
                                                .responsiveFontSize(
                                                    context, 10),
                                            color: AppColors.primaryColor1,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
