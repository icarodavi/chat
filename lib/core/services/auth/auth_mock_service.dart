import 'dart:math';

import 'package:chat/core/models/chat_user.dart';
import 'dart:io';
import 'dart:async';

import 'package:chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static final Map<String, ChatUser> _users = {};
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
    _currentUser = null;
    _updateUser(_currentUser);
  });

  static void _updateUser(ChatUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }

  @override
  ChatUser? get currentUser => _currentUser;

  @override
  Future<void> login(
    String email,
    String password,
  ) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  @override
  Future<void> signUp(
    String name,
    String email,
    String password,
    File image,
  ) async {
    final newUser = ChatUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      password: password,
      imageURL: image.path,
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Stream<ChatUser?> get userChanges => _userStream;
}
