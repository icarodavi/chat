import 'package:chat/pages/auth_page.dart';
// import 'package:chat/pages/loading_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
        primarySwatch: Colors.lightGreen,
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: Colors.lightGreen,
              secondary: Colors.white,
              inversePrimary: Colors.white,
            ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      theme: theme.copyWith(),
      home: const AuthPage(),
    );
  }
}
