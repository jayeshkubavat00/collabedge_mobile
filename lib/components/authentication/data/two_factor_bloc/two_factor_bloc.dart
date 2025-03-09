import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/utils/contants/app_string.dart';

part 'two_factor_event.dart';
part 'two_factor_state.dart';

class TwoFactorBloc extends Bloc<TwoFactorEvent, TwoFactorState> {
  TwoFactorBloc() : super(TwoFactorInitial()) {
    on<TwoFactorSubmittedEvent>(_twoFactorSubmitted);
  }

  final TextEditingController otpController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> _twoFactorSubmitted(
      TwoFactorSubmittedEvent event, Emitter<TwoFactorState> emit) async {
    emit(TwoFactorLoading());

    if (formKey.currentState!.validate()) {
      if (otpController.text == "1234") {
        await Future.delayed(const Duration(seconds: 2));
        otpController.clear();
        emit(TwoFactorSuccess());
      } else {
        otpController.clear();
        emit(TwoFactorFailure(error: AppString.invalidOtp));
      }
    } else {
      emit(TwoFactorFailure(error: AppString.invalidOtp));
    }
  }
}
