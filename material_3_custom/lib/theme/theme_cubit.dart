import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit()
      : super(ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xff6750a4),
        ));

  bool m3 = true;
  Brightness br = Brightness.light;
  Color color = const Color(0xff6750a4);

  void changeColor(Color val) {
    // print(val);
    color = val;
    emit(ThemeData(useMaterial3: m3, colorSchemeSeed: color, brightness: br));
  }

  void changeBr(Brightness brightness) {
    br = brightness;
    emit(ThemeData(useMaterial3: m3, colorSchemeSeed: color, brightness: br));
  }

  void changeM3(bool val) {
    m3 = val;
    emit(ThemeData(useMaterial3: m3, colorSchemeSeed: color, brightness: br));
  }
}
