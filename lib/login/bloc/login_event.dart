part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class NavToSignUpLoginPageEvent extends LoginEvent {
  final bool isSignUp;

  NavToSignUpLoginPageEvent({required this.isSignUp});
}

final class NavToDashboardPageEvent extends LoginEvent {}