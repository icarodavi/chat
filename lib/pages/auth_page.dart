import 'package:chat/components/auth_form.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Stack(
          children: [
            // Container(
            //   decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //       colors: [
            //         Color.fromARGB(255, 175, 235, 107),
            //         Color.fromARGB(255, 65, 97, 28)
            //       ],
            //       begin: Alignment.topCenter,
            //       end: Alignment.bottomRight,
            //     ),
            //   ),
            // ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AuthForm(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
