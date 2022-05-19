import 'package:flutter/material.dart';

class LoadingScreenPage extends StatefulWidget {
  const LoadingScreenPage({Key? key}) : super(key: key);

  @override
  State<LoadingScreenPage> createState() => _LoadingScreenPageState();
}

class _LoadingScreenPageState extends State<LoadingScreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 175, 235, 107),
                    Color.fromARGB(255, 65, 97, 28)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Carregando...',
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          color: Colors.white,
                        ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
