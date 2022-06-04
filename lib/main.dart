import 'package:flutter/material.dart';

void main() {
  runApp(const Dex());
}

class Dex extends StatelessWidget {
  const Dex({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Dex',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
          onPrimary: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      home: const Text("Homepage"),
    );
  }
}
