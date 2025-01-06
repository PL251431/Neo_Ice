import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0043c5),
      surfaceTint: Color(0xff004fe4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2f68ff),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff475b9d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffafbfff),
      onSecondaryContainer: Color(0xff182e6e),
      tertiary: Color(0xff594bc8),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff998fff),
      onTertiaryContainer: Color(0xff0b0043),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff191b24),
      onSurfaceVariant: Color(0xff434655),
      outline: Color(0xff737687),
      outlineVariant: Color(0xffc3c5d8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3039),
      inversePrimary: Color(0xffb6c4ff),
      primaryFixed: Color(0xffdce1ff),
      onPrimaryFixed: Color(0xff00164e),
      primaryFixedDim: Color(0xffb6c4ff),
      onPrimaryFixedVariant: Color(0xff003baf),
      secondaryFixed: Color(0xffdce1ff),
      onSecondaryFixed: Color(0xff00164e),
      secondaryFixedDim: Color(0xffb6c4ff),
      onSecondaryFixedVariant: Color(0xff2f4384),
      tertiaryFixed: Color(0xffe4dfff),
      onTertiaryFixed: Color(0xff160066),
      tertiaryFixedDim: Color(0xffc6bfff),
      onTertiaryFixedVariant: Color(0xff402faf),
      surfaceDim: Color(0xffd9d9e5),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f2ff),
      surfaceContainer: Color(0xffededf9),
      surfaceContainerHigh: Color(0xffe7e7f4),
      surfaceContainerHighest: Color(0xffe1e1ee),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0038a6),
      surfaceTint: Color(0xff004fe4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff2f68ff),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff2a3f7f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff5e71b5),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3c2aab),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff6f63e0),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff191b24),
      onSurfaceVariant: Color(0xff3f4251),
      outline: Color(0xff5b5e6e),
      outlineVariant: Color(0xff777a8b),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3039),
      inversePrimary: Color(0xffb6c4ff),
      primaryFixed: Color(0xff2e68ff),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff004ddf),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5e71b5),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff45589a),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff6f63e0),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff5648c5),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd9d9e5),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f2ff),
      surfaceContainer: Color(0xffededf9),
      surfaceContainerHigh: Color(0xffe7e7f4),
      surfaceContainerHighest: Color(0xffe1e1ee),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff001c5d),
      surfaceTint: Color(0xff004fe4),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0038a6),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff001c5d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2a3f7f),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1b0079),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3c2aab),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffaf8ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff202331),
      outline: Color(0xff3f4251),
      outlineVariant: Color(0xff3f4251),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2e3039),
      inversePrimary: Color(0xffe9ebff),
      primaryFixed: Color(0xff0038a6),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002575),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2a3f7f),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff102768),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3c2aab),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff240096),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffd9d9e5),
      surfaceBright: Color(0xfffaf8ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff3f2ff),
      surfaceContainer: Color(0xffededf9),
      surfaceContainerHigh: Color(0xffe7e7f4),
      surfaceContainerHighest: Color(0xffe1e1ee),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb6c4ff),
      surfaceTint: Color(0xffb6c4ff),
      onPrimary: Color(0xff00287d),
      primaryContainer: Color(0xff205ef5),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffb6c4ff),
      onSecondary: Color(0xff152b6c),
      secondaryContainer: Color(0xff253a7a),
      onSecondaryContainer: Color(0xffc5d0ff),
      tertiary: Color(0xffc6bfff),
      onTertiary: Color(0xff280a99),
      tertiaryContainer: Color(0xff6f63e0),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff11131b),
      onSurface: Color(0xffe1e1ee),
      onSurfaceVariant: Color(0xffc3c5d8),
      outline: Color(0xff8d90a1),
      outlineVariant: Color(0xff434655),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e1ee),
      inversePrimary: Color(0xff004fe4),
      primaryFixed: Color(0xffdce1ff),
      onPrimaryFixed: Color(0xff00164e),
      primaryFixedDim: Color(0xffb6c4ff),
      onPrimaryFixedVariant: Color(0xff003baf),
      secondaryFixed: Color(0xffdce1ff),
      onSecondaryFixed: Color(0xff00164e),
      secondaryFixedDim: Color(0xffb6c4ff),
      onSecondaryFixedVariant: Color(0xff2f4384),
      tertiaryFixed: Color(0xffe4dfff),
      onTertiaryFixed: Color(0xff160066),
      tertiaryFixedDim: Color(0xffc6bfff),
      onTertiaryFixedVariant: Color(0xff402faf),
      surfaceDim: Color(0xff11131b),
      surfaceBright: Color(0xff373942),
      surfaceContainerLowest: Color(0xff0c0e16),
      surfaceContainerLow: Color(0xff191b24),
      surfaceContainer: Color(0xff1d1f28),
      surfaceContainerHigh: Color(0xff282a33),
      surfaceContainerHighest: Color(0xff32343e),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffbbc9ff),
      surfaceTint: Color(0xffb6c4ff),
      onPrimary: Color(0xff001143),
      primaryContainer: Color(0xff668aff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffbbc9ff),
      onSecondary: Color(0xff001143),
      secondaryContainer: Color(0xff7a8ed4),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffcac4ff),
      onTertiary: Color(0xff110057),
      tertiaryContainer: Color(0xff8c80ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11131b),
      onSurface: Color(0xfffcfaff),
      onSurfaceVariant: Color(0xffc7cadc),
      outline: Color(0xff9fa2b4),
      outlineVariant: Color(0xff7f8293),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e1ee),
      inversePrimary: Color(0xff003cb2),
      primaryFixed: Color(0xffdce1ff),
      onPrimaryFixed: Color(0xff000d37),
      primaryFixedDim: Color(0xffb6c4ff),
      onPrimaryFixedVariant: Color(0xff002d8a),
      secondaryFixed: Color(0xffdce1ff),
      onSecondaryFixed: Color(0xff000d37),
      secondaryFixedDim: Color(0xffb6c4ff),
      onSecondaryFixedVariant: Color(0xff1c3272),
      tertiaryFixed: Color(0xffe4dfff),
      onTertiaryFixed: Color(0xff0d0049),
      tertiaryFixedDim: Color(0xffc6bfff),
      onTertiaryFixedVariant: Color(0xff2f179f),
      surfaceDim: Color(0xff11131b),
      surfaceBright: Color(0xff373942),
      surfaceContainerLowest: Color(0xff0c0e16),
      surfaceContainerLow: Color(0xff191b24),
      surfaceContainer: Color(0xff1d1f28),
      surfaceContainerHigh: Color(0xff282a33),
      surfaceContainerHighest: Color(0xff32343e),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffcfaff),
      surfaceTint: Color(0xffb6c4ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffbbc9ff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffcfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffbbc9ff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfffef9ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffcac4ff),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff11131b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfffcfaff),
      outline: Color(0xffc7cadc),
      outlineVariant: Color(0xffc7cadc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe1e1ee),
      inversePrimary: Color(0xff00226f),
      primaryFixed: Color(0xffe2e6ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffbbc9ff),
      onPrimaryFixedVariant: Color(0xff001143),
      secondaryFixed: Color(0xffe2e6ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffbbc9ff),
      onSecondaryFixedVariant: Color(0xff001143),
      tertiaryFixed: Color(0xffe9e3ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffcac4ff),
      onTertiaryFixedVariant: Color(0xff110057),
      surfaceDim: Color(0xff11131b),
      surfaceBright: Color(0xff373942),
      surfaceContainerLowest: Color(0xff0c0e16),
      surfaceContainerLow: Color(0xff191b24),
      surfaceContainer: Color(0xff1d1f28),
      surfaceContainerHigh: Color(0xff282a33),
      surfaceContainerHighest: Color(0xff32343e),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
