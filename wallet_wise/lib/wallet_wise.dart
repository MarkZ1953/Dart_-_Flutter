import 'package:flutter/material.dart';
import 'package:wallet_wise/widgets/expenses.dart';

var kColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 32, 6, 180));

var kColorSchemeDark = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 32, 6, 180),
  brightness: Brightness.dark,
);

class WalletWise extends StatelessWidget {
  const WalletWise({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet Wise',
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchemeDark,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorSchemeDark.secondaryContainer,
          foregroundColor: kColorSchemeDark.onSecondaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorSchemeDark.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchemeDark.primaryContainer,
          ),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorSchemeDark.onSecondaryContainer,
                fontSize: 17,
              ),
            ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 17,
              ),
            ),
      ),
      home: const Expenses(),
      themeMode: ThemeMode.system,
    );
  }
}
