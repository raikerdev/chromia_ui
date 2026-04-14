part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final ChromiaBrandConfig selectedBrand;

  const ThemeState({
    this.themeMode = ThemeMode.light,
    this.selectedBrand = BrandConfigs.chromia,
  });

  bool get isDark => themeMode == ThemeMode.dark;

  ThemeState copyWith({ThemeMode? themeMode, ChromiaBrandConfig? selectedBrand}) => ThemeState(
    themeMode: themeMode ?? this.themeMode,
    selectedBrand: selectedBrand ?? this.selectedBrand,
  );

  @override
  List<Object?> get props => [
    themeMode,
    selectedBrand,
  ];
}
