part of 'forget_bloc.dart';

sealed class ForgetEvent extends Equatable {
  const ForgetEvent();

  @override
  List<Object> get props => [];
}

class ForgetSubmittedEvent extends ForgetEvent {}
