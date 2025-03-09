import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/components/authentication/data/forget_bloc/forget_bloc.dart';
import 'package:flutter_sample/components/authentication/data/two_factor_bloc/two_factor_bloc.dart';
import 'package:flutter_sample/shared/common_widgets/app_button.dart';
import 'package:flutter_sample/shared/common_widgets/app_textform_field.dart';
import 'package:flutter_sample/shared/common_widgets/app_toast_message.dart';
import 'package:flutter_sample/utils/contants/app_assets.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/contants/app_string.dart';
import 'package:flutter_sample/utils/contants/app_textbutton.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';
import 'package:flutter_svg/svg.dart';

class TwoFactorScreen extends StatelessWidget {
  const TwoFactorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TwoFactorBloc(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: BlocListener<TwoFactorBloc, TwoFactorState>(
            listener: (context, state) {
              if (state is TwoFactorFailure) {
                appToast  (
                  icon: AppAssets.icWarning,
                  status: ToastStatus.error,
                  msg: AppString.invalidOtp,
                  context: context,
                );
              }
            },
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BlocBuilder<TwoFactorBloc, TwoFactorState>(
                    builder: (context, state) {
                      final bloc = context.read<TwoFactorBloc>();
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
                                    color: AppColors.lightBlue,
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    AppAssets.icSecure,
                                    fit: BoxFit.contain,
                                    height: ResponsiveHelper.responsiveHeight(
                                        context, 0.050),
                                    width: ResponsiveHelper.responsiveWidth(
                                        context, 0.050),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: ResponsiveHelper.responsiveHeight(
                                    context, 0.020),
                              ),
                              Center(
                                child: Text(
                                  AppString.twoFactorAuthentication,
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveHelper.responsiveFontSize(
                                              context, 15),
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
                                  AppString.enterCodeSentYourDevice,
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveHelper.responsiveFontSize(
                                              context, 10),
                                      color: AppColors.naturalBlack,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Center(
                                child: Text(
                                  AppString.codeSentTo,
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveHelper.responsiveFontSize(
                                              context, 10),
                                      color: AppColors.darkGray,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: ResponsiveHelper.responsiveHeight(
                                    context, 0.030),
                              ),
                              AppTextFormField(
                                  labelText: "",
                                  hintText: AppString.enterOtp,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return AppString.pleaseEnterOtp;
                                    }
                                    return null;
                                  },
                                  controller: bloc.otpController),
                              SizedBox(
                                height: ResponsiveHelper.responsiveHeight(
                                    context, 0.030),
                              ),
                              Center(
                                child: Text(
                                  AppString.codeExpiresIn,
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveHelper.responsiveFontSize(
                                              context, 10),
                                      color: AppColors.darkGray,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                height: ResponsiveHelper.responsiveHeight(
                                    context, 0.030),
                              ),
                              AppButton(
                                isLoadingState: state is ForgetLoading,
                                text: AppString.verifyCode,
                                onPressed: () {
                                  bloc.add(TwoFactorSubmittedEvent());
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
                                  text: AppString.resendCode,
                                  textStyle: TextStyle(
                                      fontSize:
                                          ResponsiveHelper.responsiveFontSize(
                                              context, 10),
                                      color: AppColors.primaryColor1,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(
                                  height: ResponsiveHelper.responsiveHeight(
                                      context, 0.008)),
                              Center(
                                child: AppTextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  text: AppString.tryAnotherMethod,
                                  textStyle: TextStyle(
                                      fontSize:
                                          ResponsiveHelper.responsiveFontSize(
                                              context, 10),
                                      color: AppColors.primaryColor1,
                                      fontWeight: FontWeight.w500),
                                ),
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
    );
  }
}
