import 'package:chat/core/models/chat_user.dart';
import 'dart:io';

import 'package:chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  @override
  ChatUser? get currentUser => null;

  @override
  Future<void> login(
    String email,
    String password,
  ) {
    throw UnimplementedError();
  }

  @override
  Future<void> logout() {
    throw UnimplementedError();
  }

  @override
  Future<void> signUp(
    String name,
    String email,
    String password,
    File image,
  ) {
    throw UnimplementedError();
  }

  @override
  Stream<ChatUser?> get userChanges => throw UnimplementedError();
}
