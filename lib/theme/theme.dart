import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      surfaceTint: Color(4287254570),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4294950037),
      onPrimaryContainer: Color(4284230664),
      secondary: Color(4286011205),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4294957766),
      onSecondaryContainer: Color(4284367152),
      tertiary: Color(4284506654),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291743872),
      onTertiaryContainer: Color(4282006528),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294965493),
      onSurface: Color(4280293911),
      onSurfaceVariant: Color(4283581500),
      outline: Color(4286936170),
      outlineVariant: Color(4292330168),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741099),
      inversePrimary: Color(4294948491),
      primaryFixed: Color(4294958024),
      onPrimaryFixed: Color(4281471488),
      primaryFixedDim: Color(4294948491),
      onPrimaryFixedVariant: Color(4285348117),
      secondaryFixed: Color(4294958024),
      onSecondaryFixed: Color(4281079304),
      secondaryFixedDim: Color(4293377704),
      onSecondaryFixedVariant: Color(4284301359),
      tertiaryFixed: Color(4293322645),
      onTertiaryFixed: Color(4280032512),
      tertiaryFixedDim: Color(4291414908),
      onTertiaryFixedVariant: Color(4282927622),
      surfaceDim: Color(4293187538),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898155),
      surfaceContainer: Color(4294568933),
      surfaceContainerHigh: Color(4294174432),
      surfaceContainerHighest: Color(4293779674),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4285084945),
      surfaceTint: Color(4287254570),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4288963901),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4284038188),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4287589722),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4282664450),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4285954099),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965493),
      onSurface: Color(4280293911),
      onSurfaceVariant: Color(4283318328),
      outline: Color(4285291603),
      outlineVariant: Color(4287199086),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741099),
      inversePrimary: Color(4294948491),
      primaryFixed: Color(4288963901),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4287057192),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4287589722),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4285814083),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4285954099),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4284309276),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293187538),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898155),
      surfaceContainer: Color(4294568933),
      surfaceContainerHigh: Color(4294174432),
      surfaceContainerHighest: Color(4293779674),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4282128384),
      surfaceTint: Color(4287254570),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4285084945),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281605390),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284038188),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4280493056),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4282664450),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294965493),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4281147674),
      outline: Color(4283318328),
      outlineVariant: Color(4283318328),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281741099),
      inversePrimary: Color(4294961116),
      primaryFixed: Color(4285084945),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4283244544),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284038188),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282394391),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4282664450),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4281151232),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4293187538),
      surfaceBright: Color(4294965493),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294898155),
      surfaceContainer: Color(4294568933),
      surfaceContainerHigh: Color(4294174432),
      surfaceContainerHighest: Color(4293779674),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294960085),
      surfaceTint: Color(4294948491),
      onPrimary: Color(4283572993),
      primaryContainer: Color(4294552960),
      onPrimaryContainer: Color(4283572993),
      secondary: Color(4293377704),
      onSecondary: Color(4282657307),
      secondaryContainer: Color(4283578151),
      onSecondaryContainer: Color(4294101170),
      tertiary: Color(4293586073),
      onTertiary: Color(4281414400),
      tertiaryContainer: Color(4290822772),
      onTertiaryContainer: Color(4281348608),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279767567),
      onSurface: Color(4293779674),
      onSurfaceVariant: Color(4292330168),
      outline: Color(4288712067),
      outlineVariant: Color(4283581500),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293779674),
      inversePrimary: Color(4287254570),
      primaryFixed: Color(4294958024),
      onPrimaryFixed: Color(4281471488),
      primaryFixedDim: Color(4294948491),
      onPrimaryFixedVariant: Color(4285348117),
      secondaryFixed: Color(4294958024),
      onSecondaryFixed: Color(4281079304),
      secondaryFixedDim: Color(4293377704),
      onSecondaryFixedVariant: Color(4284301359),
      tertiaryFixed: Color(4293322645),
      onTertiaryFixed: Color(4280032512),
      tertiaryFixedDim: Color(4291414908),
      onTertiaryFixedVariant: Color(4282927622),
      surfaceDim: Color(4279767567),
      surfaceBright: Color(4282333236),
      surfaceContainerLowest: Color(4279373066),
      surfaceContainerLow: Color(4280293911),
      surfaceContainer: Color(4280622619),
      surfaceContainerHigh: Color(4281280805),
      surfaceContainerHighest: Color(4282069807),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294960085),
      surfaceTint: Color(4294948491),
      onPrimary: Color(4283375872),
      primaryContainer: Color(4294552960),
      onPrimaryContainer: Color(4278911488),
      secondary: Color(4293706412),
      onSecondary: Color(4280684804),
      secondaryContainer: Color(4289628532),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4293586073),
      onTertiary: Color(4281216768),
      tertiaryContainer: Color(4290822772),
      onTertiaryContainer: Color(4278321664),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279767567),
      onSurface: Color(4294966008),
      onSurfaceVariant: Color(4292658876),
      outline: Color(4289961877),
      outlineVariant: Color(4287790966),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293779674),
      inversePrimary: Color(4285479446),
      primaryFixed: Color(4294958024),
      onPrimaryFixed: Color(4280420864),
      primaryFixedDim: Color(4294948491),
      onPrimaryFixedVariant: Color(4284033285),
      secondaryFixed: Color(4294958024),
      onSecondaryFixed: Color(4280290306),
      secondaryFixedDim: Color(4293377704),
      onSecondaryFixedVariant: Color(4283052064),
      tertiaryFixed: Color(4293322645),
      onTertiaryFixed: Color(4279308800),
      tertiaryFixedDim: Color(4291414908),
      onTertiaryFixedVariant: Color(4281809152),
      surfaceDim: Color(4279767567),
      surfaceBright: Color(4282333236),
      surfaceContainerLowest: Color(4279373066),
      surfaceContainerLow: Color(4280293911),
      surfaceContainer: Color(4280622619),
      surfaceContainerHigh: Color(4281280805),
      surfaceContainerHighest: Color(4282069807),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4294966008),
      surfaceTint: Color(4294948491),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4294950037),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4294966008),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4293706412),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294901689),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291678080),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279767567),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294966008),
      outline: Color(4292658876),
      outlineVariant: Color(4292658876),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4293779674),
      inversePrimary: Color(4282916352),
      primaryFixed: Color(4294959569),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4294950037),
      onPrimaryFixedVariant: Color(4280946176),
      secondaryFixed: Color(4294959569),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4293706412),
      onSecondaryFixedVariant: Color(4280684804),
      tertiaryFixed: Color(4293586073),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4291678080),
      onTertiaryFixedVariant: Color(4279703552),
      surfaceDim: Color(4279767567),
      surfaceBright: Color(4282333236),
      surfaceContainerLowest: Color(4279373066),
      surfaceContainerLow: Color(4280293911),
      surfaceContainer: Color(4280622619),
      surfaceContainerHigh: Color(4281280805),
      surfaceContainerHighest: Color(4282069807),
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
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
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
