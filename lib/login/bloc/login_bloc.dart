import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    /// Event to navigate to sign up login page
    on<NavToSignUpLoginPageEvent>(navToSignUpLoginPageEvent);

    /// Event to navigate to dashboard page
    on<NavToDashboardPageEvent>(navToDashboardPageEvent);
  }

  navToSignUpLoginPageEvent(NavToSignUpLoginPageEvent event, Emitter emit)  {
    emit(LoginInitial());
    emit(NavToSignUpLoginPageState(isSignUp: event.isSignUp));
  }

  navToDashboardPageEvent(NavToDashboardPageEvent event, Emitter emit) {
    emit(LoginInitial());
    emit(NavToDashboardPageState());
  }
}
