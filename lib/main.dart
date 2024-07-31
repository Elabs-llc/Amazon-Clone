import 'package:flutter/material.dart';
import 'package:shopify/uitils/theme.dart';
import 'package:shopify/view/auth_screen.dart';

void main() {
  runApp(const Shopify());
}

class Shopify extends StatelessWidget {
  const Shopify({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
      theme: theme,
    );
  }
}