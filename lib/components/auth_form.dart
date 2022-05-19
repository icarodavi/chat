// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:chat/components/user_image_picker.dart';
import 'package:chat/models/auth_form_data.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.onSubmit, {Key? key}) : super(key: key);
  final void Function(AuthFormData) onSubmit;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formData = AuthFormData();
  final _formKey = GlobalKey<FormState>();

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;
    if (_formData.image == null && _formData.isSignUp) {
      return _showError('Imagem não selecionada');
    }

    widget.onSubmit(_formData);
  }

  void _showError(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Theme.of(context).colorScheme.error,
      ),
    );
  }

  void _handleImagePick(File image) {
    _formData.image = image;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              if (_formData.isSignUp)
                UserImagePicker(
                  onImagePick: _handleImagePick,
                ),
              if (_formData.isSignUp)
                TextFormField(
                  key: const ValueKey('name'),
                  decoration: const InputDecoration(labelText: 'Nome'),
                  initialValue: _formData.name,
                  onChanged: (name) => _formData.name = name,
                  validator: (_name) {
                    final name = _name ?? '';
                    if (name.trim().length < 5) {
                      return 'O nome deve ter no mínimo 5 caracteres';
                    }
                    return null;
                  },
                ),
              TextFormField(
                key: const ValueKey('email'),
                initialValue: _formData.email,
                onChanged: (email) => _formData.email = email,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (_email) {
                  final email = _email ?? '';
                  if (email.trim().length < 3) {
                    return 'O email deve ter no mínimo 3 caracteres';
                  }
                  if (!email.contains('@')) {
                    return 'Digite um email válido.';
                  }
                  return null;
                },
              ),
              TextFormField(
                key: const ValueKey('password'),
                initialValue: _formData.password,
                onChanged: (password) => _formData.password = password,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Senha'),
                validator: (_password) {
                  final password = _password ?? '';
                  if (password.trim().length < 6) {
                    return 'A senha deve ter no mínimo 6 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton.icon(
                onPressed: _submit,
                icon: const Icon(Icons.door_front_door_outlined),
                label: Text(_formData.isLogin ? 'Entrar' : 'Cadastrar'),
              ),
              TextButton.icon(
                  onPressed: () {
                    setState(() {
                      _formData.toggleAuthMode();
                    });
                  },
                  icon: const Icon(Icons.account_circle),
                  label: Text(_formData.isLogin
                      ? 'Criar nova conta?'
                      : 'Já possui conta?'))
            ],
          ),
        ),
      ),
    );
  }
}
