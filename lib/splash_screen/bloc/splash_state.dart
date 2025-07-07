part of 'splash_bloc.dart';

@immutable
sealed class SplashState {}

final class SplashInitial extends SplashState {}

final class SplashListenerState extends SplashState {}

final class SplashNavigateToLoginActionState extends SplashListenerState {}

final class SplashNavigateToHomeActionState extends SplashListenerState {}