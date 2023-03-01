import 'package:elahan_kscs/auth/screen/logine_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16.0),
          bodyMedium: TextStyle(fontSize: 14.0),
        )
      ),
      home: LoginScreen(),
    );
  }
}
