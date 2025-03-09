part of 'two_factor_bloc.dart';

sealed class TwoFactorEvent extends Equatable {
  const TwoFactorEvent();

  @override
  List<Object> get props => [];
}

class TwoFactorSubmittedEvent extends TwoFactorEvent {}
