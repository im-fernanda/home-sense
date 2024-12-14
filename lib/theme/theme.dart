import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278610769),
      surfaceTint: Color(4278610769),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4286698675),
      onPrimaryContainer: Color(4278205484),
      secondary: Color(4282869080),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4291554524),
      onSecondaryContainer: Color(4281421635),
      tertiary: Color(4283393335),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4291815855),
      onTertiaryContainer: Color(4281879841),
      error: Color(4290386458),
      onError: Color(4294967295),
      errorContainer: Color(4294957782),
      onErrorContainer: Color(4282449922),
      surface: Color(4294441718),
      onSurface: Color(4279770394),
      onSurfaceVariant: Color(4282337604),
      outline: Color(4285495924),
      outlineVariant: Color(4290693570),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151791),
      inversePrimary: Color(4286830518),
      primaryFixed: Color(4288672721),
      onPrimaryFixed: Color(4278198550),
      primaryFixedDim: Color(4286830518),
      onPrimaryFixedVariant: Color(4278210876),
      secondaryFixed: Color(4291422938),
      onSecondaryFixed: Color(4278329367),
      secondaryFixedDim: Color(4289580734),
      onSecondaryFixedVariant: Color(4281290049),
      tertiaryFixed: Color(4291947441),
      onTertiaryFixed: Color(4279181312),
      tertiaryFixedDim: Color(4290105239),
      onTertiaryFixedVariant: Color(4281879841),
      surfaceDim: Color(4292336599),
      surfaceBright: Color(4294441718),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047216),
      surfaceContainer: Color(4293652459),
      surfaceContainerHigh: Color(4293257701),
      surfaceContainerHighest: Color(4292928479),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278209849),
      surfaceTint: Color(4278610769),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4281107046),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4281026877),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4284250990),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4281616670),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4284841035),
      onTertiaryContainer: Color(4294967295),
      error: Color(4287365129),
      onError: Color(4294967295),
      errorContainer: Color(4292490286),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441718),
      onSurface: Color(4279770394),
      onSurfaceVariant: Color(4282074432),
      outline: Color(4283916636),
      outlineVariant: Color(4285693303),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151791),
      inversePrimary: Color(4286830518),
      primaryFixed: Color(4281107046),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278217039),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4284250990),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4282671701),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4284841035),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4283261749),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336599),
      surfaceBright: Color(4294441718),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047216),
      surfaceContainer: Color(4293652459),
      surfaceContainerHigh: Color(4293257701),
      surfaceContainerHighest: Color(4292928479),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(4278200348),
      surfaceTint: Color(4278610769),
      onPrimary: Color(4294967295),
      primaryContainer: Color(4278209849),
      onPrimaryContainer: Color(4294967295),
      secondary: Color(4278724381),
      onSecondary: Color(4294967295),
      secondaryContainer: Color(4281026877),
      onSecondaryContainer: Color(4294967295),
      tertiary: Color(4279510786),
      onTertiary: Color(4294967295),
      tertiaryContainer: Color(4281616670),
      onTertiaryContainer: Color(4294967295),
      error: Color(4283301890),
      onError: Color(4294967295),
      errorContainer: Color(4287365129),
      onErrorContainer: Color(4294967295),
      surface: Color(4294441718),
      onSurface: Color(4278190080),
      onSurfaceVariant: Color(4280034850),
      outline: Color(4282074432),
      outlineVariant: Color(4282074432),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4281151791),
      inversePrimary: Color(4289330651),
      primaryFixed: Color(4278209849),
      onPrimaryFixed: Color(4294967295),
      primaryFixedDim: Color(4278203429),
      onPrimaryFixedVariant: Color(4294967295),
      secondaryFixed: Color(4281026877),
      onSecondaryFixed: Color(4294967295),
      secondaryFixedDim: Color(4279513639),
      onSecondaryFixedVariant: Color(4294967295),
      tertiaryFixed: Color(4281616670),
      onTertiaryFixed: Color(4294967295),
      tertiaryFixedDim: Color(4280234505),
      onTertiaryFixedVariant: Color(4294967295),
      surfaceDim: Color(4292336599),
      surfaceBright: Color(4294441718),
      surfaceContainerLowest: Color(4294967295),
      surfaceContainerLow: Color(4294047216),
      surfaceContainer: Color(4293652459),
      surfaceContainerHigh: Color(4293257701),
      surfaceContainerHighest: Color(4292928479),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288409549),
      surfaceTint: Color(4286830518),
      onPrimary: Color(4278204457),
      primaryContainer: Color(4285711525),
      onPrimaryContainer: Color(4278202402),
      secondary: Color(4289580734),
      onSecondary: Color(4279776811),
      secondaryContainer: Color(4280632119),
      onSecondaryContainer: Color(4290238664),
      tertiary: Color(4294967295),
      onTertiary: Color(4280432141),
      tertiaryContainer: Color(4291026340),
      onTertiaryContainer: Color(4281419035),
      error: Color(4294948011),
      onError: Color(4285071365),
      errorContainer: Color(4287823882),
      onErrorContainer: Color(4294957782),
      surface: Color(4279243794),
      onSurface: Color(4292928479),
      onSurfaceVariant: Color(4290693570),
      outline: Color(4287140749),
      outlineVariant: Color(4282337604),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928479),
      inversePrimary: Color(4278610769),
      primaryFixed: Color(4288672721),
      onPrimaryFixed: Color(4278198550),
      primaryFixedDim: Color(4286830518),
      onPrimaryFixedVariant: Color(4278210876),
      secondaryFixed: Color(4291422938),
      onSecondaryFixed: Color(4278329367),
      secondaryFixedDim: Color(4289580734),
      onSecondaryFixedVariant: Color(4281290049),
      tertiaryFixed: Color(4291947441),
      onTertiaryFixed: Color(4279181312),
      tertiaryFixedDim: Color(4290105239),
      onTertiaryFixedVariant: Color(4281879841),
      surfaceDim: Color(4279243794),
      surfaceBright: Color(4281743928),
      surfaceContainerLowest: Color(4278914829),
      surfaceContainerLow: Color(4279770394),
      surfaceContainer: Color(4280033566),
      surfaceContainerHigh: Color(4280691496),
      surfaceContainerHighest: Color(4281415219),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4288409549),
      surfaceTint: Color(4286830518),
      onPrimary: Color(4278201888),
      primaryContainer: Color(4285711525),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4289843906),
      onSecondary: Color(4278197010),
      secondaryContainer: Color(4286093449),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294967295),
      onTertiary: Color(4280432141),
      tertiaryContainer: Color(4291026340),
      onTertiaryContainer: Color(4279378944),
      error: Color(4294949553),
      onError: Color(4281794561),
      errorContainer: Color(4294923337),
      onErrorContainer: Color(4278190080),
      surface: Color(4279243794),
      onSurface: Color(4294507767),
      onSurfaceVariant: Color(4290956742),
      outline: Color(4288325023),
      outlineVariant: Color(4286285439),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928479),
      inversePrimary: Color(4278211133),
      primaryFixed: Color(4288672721),
      onPrimaryFixed: Color(4278195469),
      primaryFixedDim: Color(4286830518),
      onPrimaryFixedVariant: Color(4278206254),
      secondaryFixed: Color(4291422938),
      onSecondaryFixed: Color(4278195469),
      secondaryFixedDim: Color(4289580734),
      onSecondaryFixedVariant: Color(4280171568),
      tertiaryFixed: Color(4291947441),
      onTertiaryFixed: Color(4278719488),
      tertiaryFixedDim: Color(4290105239),
      onTertiaryFixedVariant: Color(4280826898),
      surfaceDim: Color(4279243794),
      surfaceBright: Color(4281743928),
      surfaceContainerLowest: Color(4278914829),
      surfaceContainerLow: Color(4279770394),
      surfaceContainer: Color(4280033566),
      surfaceContainerHigh: Color(4280691496),
      surfaceContainerHighest: Color(4281415219),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(4293787637),
      surfaceTint: Color(4286830518),
      onPrimary: Color(4278190080),
      primaryContainer: Color(4287159226),
      onPrimaryContainer: Color(4278190080),
      secondary: Color(4293787637),
      onSecondary: Color(4278190080),
      secondaryContainer: Color(4289843906),
      onSecondaryContainer: Color(4278190080),
      tertiary: Color(4294967295),
      onTertiary: Color(4278190080),
      tertiaryContainer: Color(4291026340),
      onTertiaryContainer: Color(4278190080),
      error: Color(4294965753),
      onError: Color(4278190080),
      errorContainer: Color(4294949553),
      onErrorContainer: Color(4278190080),
      surface: Color(4279243794),
      onSurface: Color(4294967295),
      onSurfaceVariant: Color(4294114806),
      outline: Color(4290956742),
      outlineVariant: Color(4290956742),
      shadow: Color(4278190080),
      scrim: Color(4278190080),
      inverseSurface: Color(4292928479),
      inversePrimary: Color(4278202659),
      primaryFixed: Color(4288936150),
      onPrimaryFixed: Color(4278190080),
      primaryFixedDim: Color(4287159226),
      onPrimaryFixedVariant: Color(4278197010),
      secondaryFixed: Color(4291686110),
      onSecondaryFixed: Color(4278190080),
      secondaryFixedDim: Color(4289843906),
      onSecondaryFixedVariant: Color(4278197010),
      tertiaryFixed: Color(4292210869),
      onTertiaryFixed: Color(4278190080),
      tertiaryFixedDim: Color(4290433947),
      onTertiaryFixedVariant: Color(4278917632),
      surfaceDim: Color(4279243794),
      surfaceBright: Color(4281743928),
      surfaceContainerLowest: Color(4278914829),
      surfaceContainerLow: Color(4279770394),
      surfaceContainer: Color(4280033566),
      surfaceContainerHigh: Color(4280691496),
      surfaceContainerHighest: Color(4281415219),
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
