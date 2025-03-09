import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial()) {
    on<DashboarChnageTabEvent>(onChangeDashboardTab);
  }

  Future<void> onChangeDashboardTab(
      DashboarChnageTabEvent event, Emitter<DashboardState> emit) async {
    emit(DashboardLoadingState());
    emit(DashboarChnageTabState(tabIndex: event.tabIndex));
  }
}
