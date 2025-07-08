part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

final class DashboardTabSwitchEvent extends DashboardEvent {
  final int selectedTabIndex;

  DashboardTabSwitchEvent({required this.selectedTabIndex});
}