import 'package:flutter/material.dart';
import 'package:minirater/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minirater',
      theme: CustomTheme.defaultTheme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
