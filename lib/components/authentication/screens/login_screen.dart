import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/components/authentication/data/login_bloc/login_bloc.dart';
import 'package:flutter_sample/components/authentication/data/login_bloc/login_event.dart';
import 'package:flutter_sample/components/authentication/data/login_bloc/login_state.dart';
import 'package:flutter_sample/components/authentication/screens/create_account_screen.dart';
import 'package:flutter_sample/components/authentication/screens/forget_screen.dart';
import 'package:flutter_sample/shared/common_widgets/app_button.dart';
import 'package:flutter_sample/shared/common_widgets/app_checkbox.dart';
import 'package:flutter_sample/shared/common_widgets/app_scaffold.dart';
import 'package:flutter_sample/shared/common_widgets/app_system_overlay_widget.dart';
import 'package:flutter_sample/shared/common_widgets/app_textform_field.dart';
import 'package:flutter_sample/shared/common_widgets/app_toast_message.dart';
import 'package:flutter_sample/utils/contants/app_assets.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/contants/app_string.dart';
import 'package:flutter_sample/utils/contants/app_styles.dart';
import 'package:flutter_sample/utils/contants/app_textbutton.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/contants/app_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late ConfettiController _controllerCenter;
  late AnimationController _animationController;
  Timer? _confettiTimer;

  @override
  void initState() {
    super.initState();
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 2));
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    // Start periodic confetti animation every 2 seconds
    _confettiTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _controllerCenter.play();
    });
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    _animationController.dispose();
    _confettiTimer?.cancel(); // Cancel the timer when disposing
    super.dispose();
  }

  Path drawDot(Size size) {
    final path = Path();
    final radius = size.width / 2;
    path.addOval(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius));
    return path;
  }

  @override
  Widget build(BuildContext context) {
    return AppSystemOverlay(
      overlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.primaryColor1),
      child: BlocProvider(
        create: (_) => LoginBloc(),
        child: AppScaffold(
          resizeToAvoidBottomInset: false,
          body: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {}

              if (state is LoginFailure) {
                appToast(
                  icon: AppAssets.icWarning,
                  status: ToastStatus.error,
                  msg: AppString.invalidEmail,
                  // ignore: use_build_context_synchronously
                  context: context,
                );
              }
            },
            child: Stack(
              children: [
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    final bloc = context.read<LoginBloc>();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: AppColors.lightPink,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: AppStyles.minimalShadow,
                            ),
                            width: ResponsiveHelper.responsiveWidthByDevice(
                                    context,
                                    mobile: 0.9,
                                    tablet: 0.7,
                                    web: 0.4) *
                                MediaQuery.of(context).size.width,
                            child: Form(
                              key: bloc.formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  spacing: 5,
                                  children: [
                                    Text(
                                      AppString.welcomeBack,
                                      style: TextStyle(
                                          fontSize: ResponsiveHelper
                                              .responsiveFontSize(context, 18),
                                          color: AppColors.naturalBlack,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: AppTextFormField(
                                        validator: AppValidator.validateEmail,
                                        labelText: AppString.emailAddress,
                                        hintText: AppString.enterYourEmail,
                                        controller: bloc.emailController,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: AppTextFormField(
                                        validator:
                                            AppValidator.validatePassword,
                                        labelText: AppString.password,
                                        textInputAction: TextInputAction.done,
                                        hintText: AppString.enterYourPassword,
                                        controller: bloc.passwordController,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 2),
                                          child: AppCheckbox(
                                            initialValue: false,
                                            onChanged: (value) {},
                                          ),
                                        ),
                                        Expanded(
                                          child: Transform.translate(
                                            offset: Offset(-10, 0),
                                            child: Text(
                                              AppString.rememberMe,
                                              style: TextStyle(
                                                  color: AppColors.lightergray2,
                                                  fontSize: ResponsiveHelper
                                                      .responsiveFontSize(
                                                          context, 11),
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15),
                                          child: AppTextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                    builder: (context) =>
                                                        ForgetScreen(),
                                                  ));
                                            },
                                            text: AppString.forgotPassword,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: AppButton(
                                        isLoadingState: state is LoginLoading,
                                        text: AppString.signIn,
                                        onPressed: () {
                                          bloc.add(LoginSubmitted());
                                        },
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      spacing: 2,
                                      children: [
                                        Text(
                                          AppString.dontHaveAnAccount,
                                          style: TextStyle(
                                              color: AppColors.naturalBlack,
                                              fontSize: ResponsiveHelper
                                                  .responsiveFontSize(
                                                      context, 12),
                                              fontWeight: FontWeight.w400),
                                        ),
                                        AppTextButton(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                    builder: (context) =>
                                                        CreateAccountScreen(),
                                                  ));
                                            },
                                            text: AppString.signUp),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 14),
                        Row(
                          spacing: 10,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              AppAssets.icSupport,
                              height: ResponsiveHelper.responsiveHeight(
                                  context, 0.030),
                              width: ResponsiveHelper.responsiveWidth(
                                  context, 0.030),
                            ),
                            AppTextButton(
                              onPressed: () {},
                              text: AppString.needHelpContactOurSupportTeam,
                              textStyle: TextStyle(
                                  color: AppColors.redError,
                                  fontSize: ResponsiveHelper.responsiveFontSize(
                                      context, 10),
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          AppString
                              .byContinuingYouAgreeToOurTermsOfServiceAndPrivacyPolicy,
                          style: TextStyle(
                              color: AppColors.lightPink,
                              fontSize: ResponsiveHelper.responsiveFontSize(
                                  context, 10),
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: _controllerCenter,
                    blastDirectionality: BlastDirectionality.directional,
                    blastDirection: pi / 7,
                    emissionFrequency: 0.02,
                    numberOfParticles: 1,
                    shouldLoop: false,
                    colors: const [
                      Colors.green,
                      AppColors.primaryColor1,
                      AppColors.redError,
                      Colors.orange,
                      AppColors.primaryColor2,
                    ],
                    createParticlePath: (size) {
                      return drawDot(size / 2.5);
                    }, // Use the drawDot function for circular particles
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
