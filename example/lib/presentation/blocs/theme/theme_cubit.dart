import 'package:chromia_ui/chromia_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void toggleTheme() {
    emit(state.copyWith(themeMode: state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light));
  }

  void changeBrand(BrandConfig brand) {
    emit(
      state.copyWith(
        selectedBrand: brand.copyWith(
          fontFamily: GoogleFonts.poppins().fontFamily,
          monospaceFontFamily: GoogleFonts.sourceCodePro().fontFamily,
        ),
      ),
    );
  }
}
