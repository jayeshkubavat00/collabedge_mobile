import 'dart:async';
import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/components/authentication/data/login_bloc/login_bloc.dart';
import 'package:flutter_sample/components/authentication/data/login_bloc/login_state.dart';
import 'package:flutter_sample/shared/common_widgets/app_button.dart';
import 'package:flutter_sample/shared/common_widgets/app_checkbox.dart';
import 'package:flutter_sample/shared/common_widgets/app_scaffold.dart';
import 'package:flutter_sample/shared/common_widgets/app_textform_field.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/contants/app_string.dart';
import 'package:flutter_sample/utils/contants/app_styles.dart';
import 'package:flutter_sample/utils/contants/app_textbutton.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

import '../../../utils/contants/app_validator.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen>
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
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: AppScaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
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
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: AppColors.lightPink,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: AppStyles.minimalShadow,
                        ),
                        width: ResponsiveHelper.responsiveWidthByDevice(context,
                                mobile: 0.9, tablet: 0.7, web: 0.4) *
                            MediaQuery.of(context).size.width,
                        child: Form(
                          key: bloc.formKey,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              spacing: 6,
                              children: [
                                Text(
                                  AppString.createAccount,
                                  style: TextStyle(
                                      fontSize:
                                          ResponsiveHelper.responsiveFontSize(
                                              context, 18),
                                      color: AppColors.naturalBlack,
                                      fontWeight: FontWeight.w600),
                                ),
                                AppTextFormField(
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return "Please enter your full name";
                                    }
                                    return null;
                                  },
                                  labelText: AppString.fullName,
                                  hintText: AppString.enterYourFullName,
                                  controller: TextEditingController(),
                                ),
                                AppTextFormField(
                                  validator: AppValidator.validateEmail,
                                  labelText: AppString.emailAddress,
                                  hintText: AppString.enterYourEmail,
                                  controller: bloc.emailController,
                                ),
                                AppTextFormField(
                                  validator: AppValidator.validatePassword,
                                  labelText: AppString.password,
                                  textInputAction: TextInputAction.done,
                                  hintText: AppString.createYourPassword,
                                  controller: bloc.passwordController,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 2,
                                  children: [
                                    AppCheckbox(
                                      initialValue: false,
                                      onChanged: (value) {},
                                    ),
                                    Expanded(
                                      child: Text(
                                        AppString.iAgreeTermAndPolicy,
                                        style: TextStyle(
                                            color: AppColors.lightergray2,
                                            fontSize: ResponsiveHelper
                                                .responsiveFontSize(
                                                    context, 11),
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                AppButton(
                                  isLoadingState: state is LoginLoading,
                                  text: AppString.signUp,
                                  onPressed: () {},
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  spacing: 2,
                                  children: [
                                    Text(
                                      AppString.alreadyHaveAnAccount,
                                      style: TextStyle(
                                          color: AppColors.naturalBlack,
                                          fontSize: ResponsiveHelper
                                              .responsiveFontSize(context, 12),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    AppTextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        text: AppString.signIn),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      AppString
                          .byContinuingYouAgreeToOurTermsOfServiceAndPrivacyPolicy,
                      style: TextStyle(
                          color: AppColors.lightPink,
                          fontSize:
                              ResponsiveHelper.responsiveFontSize(context, 10),
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
    );
  }
}
