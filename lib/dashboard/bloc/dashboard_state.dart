part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardState {}

final class DashboardInitial extends DashboardState {
  final int selectedPageIndex;
  final bool isInitial;

  DashboardInitial(
    this.isInitial, {
    required this.selectedPageIndex,
  });
}

final class DashboardListenerState extends DashboardState {}
