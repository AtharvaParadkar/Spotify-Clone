part of 'settings_bloc.dart';

@immutable
sealed class SettingsEvent {}

final class LogOutEvent extends SettingsEvent {}
