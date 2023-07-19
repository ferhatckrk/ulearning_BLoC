import 'package:bloc_app_1/pages/welcome/bloc/welcome_events.dart';
import 'package:bloc_app_1/pages/welcome/bloc/welcome_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvents, WelconeStates> {
  WelcomeBloc() : super(WelconeStates()) {
    on<WelcomeEvents>((event, emit) {
      emit(WelconeStates(pageCount: state.pageCount));
    });
  }
}
