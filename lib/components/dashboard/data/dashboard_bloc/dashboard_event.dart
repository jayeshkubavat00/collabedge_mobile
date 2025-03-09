part of 'dashboard_bloc.dart';

sealed class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboarChnageTabEvent extends DashboardEvent {
  final int tabIndex;
  const DashboarChnageTabEvent({required this.tabIndex});
  @override
  List<Object> get props => [tabIndex];
}
