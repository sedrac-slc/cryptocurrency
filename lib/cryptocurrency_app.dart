import 'package:cryptocurrency/pages/currency_page.dart';
import 'package:flutter/material.dart';

class CryptocurrencyApp extends StatelessWidget {
  const CryptocurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Cryptocurrency",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const CurrencyPage(),
    );
  }
}
