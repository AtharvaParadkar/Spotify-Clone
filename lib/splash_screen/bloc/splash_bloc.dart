import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:spotify_clone/utils/shared_prefs.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<SplashLauncherEvent>(splashLauncherEvent);
  }

  splashLauncherEvent (SplashLauncherEvent event, Emitter emit) async {
    emit(SplashInitial());
    await Future.delayed(const Duration(seconds: 1));

    // Checking if Config url is entered previously
    bool isLoginComplete = await SharedPreferenceHelper.instance.getIsLogin();

    if (isLoginComplete) {
      emit(SplashNavigateToHomeActionState());
    } else {
      emit(SplashNavigateToLoginActionState());
    }
  }
}
