import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_theme/src/config/theme/custom_theme.dart';
// import 'package:flutter_theme/src/config/theme/theme_flutter.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(FlexThemeData.light(useMaterial3: true));

  void change(ThemeData data) => emit(data);

  void changeWithIcon(bool isDark) {
    if (isDark) {
      emit(AppTheme.lightTheme);
    } else {
      emit(AppTheme.darkTheme);
    }
  }
}

class CustomTheme {
  static List<ThemeData> themes = <ThemeData>[
    // ThemeProvider(settings: settings, lightDynamic: lightDynamic, darkDynamic: darkDynamic),
    FlexThemeData.light(useMaterial3: true),
    FlexThemeData.dark(useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.amber, useMaterial3: true).toTheme,
    FlexThemeData.dark(scheme: FlexScheme.amber, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.aquaBlue, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.aquaBlue, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.bahamaBlue, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.bahamaBlue, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.barossa, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.barossa, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.bigStone, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.bigStone, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.bigStone, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.bigStone, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.blue, useMaterial3: true).toTheme,
    FlexThemeData.dark(scheme: FlexScheme.blue, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.blueWhale, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.blueWhale, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.blumineBlue, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.blumineBlue, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.brandBlue, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.brandBlue, useMaterial3: true),
    // FlexColorScheme.light(scheme: FlexScheme.custom).toTheme,
    // FlexThemeData.dark(scheme: FlexScheme.custom),
    FlexColorScheme.light(scheme: FlexScheme.damask, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.damask, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.deepBlue, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.deepBlue, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.deepPurple, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.deepPurple, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.dellGenoa, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.dellGenoa, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.wasabi, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.wasabi, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.sakura, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.sakura, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.purpleBrown, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.purpleBrown, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.shark, useMaterial3: true).toTheme,
    FlexThemeData.dark(scheme: FlexScheme.shark, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.money, useMaterial3: true).toTheme,
    FlexThemeData.dark(scheme: FlexScheme.money, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.material, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.material, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.materialHc, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.materialHc, useMaterial3: true),
    FlexColorScheme.light(
            scheme: FlexScheme.materialBaseline, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.materialBaseline, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.sanJuanBlue, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.sanJuanBlue, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.mango, useMaterial3: true).toTheme,
    FlexThemeData.dark(scheme: FlexScheme.mango, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.indigo, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.indigo, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.vesuviusBurn, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.vesuviusBurn, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.rosewood, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.rosewood, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.hippieBlue, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.hippieBlue, useMaterial3: true),
    FlexColorScheme.light(scheme: FlexScheme.flutterDash, useMaterial3: true)
        .toTheme,
    FlexThemeData.dark(scheme: FlexScheme.flutterDash, useMaterial3: true),
  ];
}
