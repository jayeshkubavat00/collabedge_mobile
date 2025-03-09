part of 'dashboard_bloc.dart';

sealed class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object> get props => [];
}

final class DashboardInitial extends DashboardState {}

class DashboarChnageTabState extends DashboardState {
  final int tabIndex;
  const DashboarChnageTabState({required this.tabIndex});
  @override
  List<Object> get props => [tabIndex];
}

class DashboardLoadingState extends DashboardState {}
