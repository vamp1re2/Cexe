import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  User? _user;

  User? get user => _user;

  bool get isLoggedIn => _user != null;

  AuthProvider() {
    _authService.userStream.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  Future<void> signInWithPhone(String phone, Function(String) codeSent) async {
    await _authService.signInWithPhone(phone, codeSent);
  }

  Future<void> verifyOTP(String verificationId, String smsCode) async {
    await _authService.verifyOTP(verificationId, smsCode);
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}