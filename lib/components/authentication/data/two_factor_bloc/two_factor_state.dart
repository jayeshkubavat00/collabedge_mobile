part of 'two_factor_bloc.dart';

sealed class TwoFactorState extends Equatable {
  const TwoFactorState();

  @override
  List<Object> get props => [];
}

final class TwoFactorInitial extends TwoFactorState {}

class TwoFactorLoading extends TwoFactorState {}

class TwoFactorSuccess extends TwoFactorState {}

class TwoFactorFailure extends TwoFactorState {
  final String error;

  const TwoFactorFailure({required this.error});
}
