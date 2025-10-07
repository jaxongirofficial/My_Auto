import 'package:flutter/material.dart';
import 'package:my_auto/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Garage App',

      // Light theme
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white, // toza oq
        colorScheme: ColorScheme.light(
          primary: const Color.fromARGB(255, 12, 73, 122),
          secondary: const Color.fromARGB(255, 255, 255, 255),
          onPrimary: Colors.white,
          surface: Colors.white,
          onSurface: Colors.black,
        ),
      ),

      darkTheme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black, // toza qora
        colorScheme: ColorScheme.dark(
          primary: const Color.fromARGB(255, 12, 73, 122),
          onPrimary: Colors.black,
          surface: Colors.black,
          onSurface: Colors.white,
        ),
      ),

      // Sistema rejimiga qarab avtomatik
      themeMode: ThemeMode.system,

      home: const LoginPage(),
    );
  }
}
