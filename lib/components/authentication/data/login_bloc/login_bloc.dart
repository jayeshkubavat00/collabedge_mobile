import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/utils/contants/app_string.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _onLoginSubmitted(
      LoginSubmitted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    if (formKey.currentState!.validate()) {
      if (emailController.text == "jayeshkubavat00@gmail.com" &&
          passwordController.text == "Jayesh00") {
        await Future.delayed(const Duration(seconds: 2));
        emailController.clear();
        passwordController.clear();
        emit(LoginSuccess());
      } else {
        emailController.clear();
        passwordController.clear();
        emit(LoginFailure(error: AppString.invalidEmailOrPassword));
      }
    } else {
      emit(LoginFailure(error: AppString.invalidEmailOrPassword));
    }
  }
}
