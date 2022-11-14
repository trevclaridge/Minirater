part of view;

class CustomTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      scaffoldBackgroundColor: Palette.background,
      primarySwatch: Colors.grey,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Palette.textGrey),
        bodyMedium: TextStyle(color: Palette.textGrey),
        bodySmall: TextStyle(color: Palette.textGrey),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        backgroundColor: Palette.background,
      ),
    );
  }
}
