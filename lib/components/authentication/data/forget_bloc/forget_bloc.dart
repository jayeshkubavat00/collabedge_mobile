import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_string.dart';

part 'forget_event.dart';
part 'forget_state.dart';

class ForgetBloc extends Bloc<ForgetEvent, ForgetState> {
  ForgetBloc() : super(ForgetInitial()) {
    on<ForgetSubmittedEvent>(_onForgetSubmitted);
  }

  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _onForgetSubmitted(
      ForgetSubmittedEvent event, Emitter<ForgetState> emit) async {
    emit(ForgetLoading());

    if (formKey.currentState!.validate()) {
      if (emailController.text == "jayeshkubavat00@gmail.com") {
        await Future.delayed(const Duration(seconds: 2));
        emailController.clear();
        emit(ForgetSuccess());
      } else {
        emailController.clear();
        emit(ForgetFailure(error: AppString.invalidEmail));
      }
    } else {
      emit(ForgetFailure(error: AppString.invalidEmail));
    }
  }
}
