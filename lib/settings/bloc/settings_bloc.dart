import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial()) {
    on<LogOutEvent>(logOutEvent);
  }

  logOutEvent (LogOutEvent event, Emitter emit) {
    // emit(SettingsInitial());
    emit(LogOutSuccessState());
  }

}
