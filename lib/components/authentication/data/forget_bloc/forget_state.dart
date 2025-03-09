part of 'forget_bloc.dart';

sealed class ForgetState extends Equatable {
  const ForgetState();

  @override
  List<Object> get props => [];
}

final class ForgetInitial extends ForgetState {}

class ForgetLoading extends ForgetState {}

class ForgetSuccess extends ForgetState {}

class ForgetFailure extends ForgetState {
  final String error;

  const ForgetFailure({required this.error});
}
