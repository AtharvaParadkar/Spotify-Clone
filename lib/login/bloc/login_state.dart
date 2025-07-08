part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginListenerState extends LoginState {}

final class NavToSignUpLoginPageState extends LoginListenerState {
  final bool isSignUp;

  NavToSignUpLoginPageState({required this.isSignUp});
}

final class NavToDashboardPageState extends LoginListenerState {}