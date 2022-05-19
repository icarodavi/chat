import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({Key? key}) : super(key: key);

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton.icon(
                // style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                //     foregroundColor:
                //         MaterialStateProperty.all<Color>(Colors.white)),
                onPressed: () {},
                icon: const Icon(Icons.door_front_door_outlined),
                label: const Text('Entrar'),
              ),
              TextButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.account_circle),
                  label: Text('Não possui conta? Faça seu cadastro'))
            ],
          ),
        ),
      ),
    );
  }
}
