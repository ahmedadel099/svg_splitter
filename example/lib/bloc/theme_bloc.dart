import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, Color> {
  ThemeBloc() : super(const Color(0xFFE71E46)) {
    on<ChangeThemeColor>((event, emit) {
      emit(event.color);
    });
  }

  void changeColor(Color color) {
    add(ChangeThemeColor(color));
  }
}

abstract class ThemeEvent {}

class ChangeThemeColor extends ThemeEvent {
  final Color color;

  ChangeThemeColor(this.color);
}

