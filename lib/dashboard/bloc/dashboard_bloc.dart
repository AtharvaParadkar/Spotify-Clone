import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitial(
          true,
          selectedPageIndex: 0,
        )) {
    on<DashboardTabSwitchEvent>(dashboardTabSwitchEvent);
  }

  /// Event to switch tabs
  dashboardTabSwitchEvent (DashboardTabSwitchEvent event, Emitter emit) {
    switch (event.selectedTabIndex) {
      case 0:
        {
          emit(DashboardInitial(false, selectedPageIndex: 0));
        }
        case 1:
        {
          emit(DashboardInitial(false, selectedPageIndex: 1));
        }
        case 2:
        {
          emit(DashboardInitial(false, selectedPageIndex: 2));
        }
        case 3:
        {
          emit(DashboardInitial(false, selectedPageIndex: 3));
        }
    }
  }

}
