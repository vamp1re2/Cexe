import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/firestore_service.dart';

class UserProvider with ChangeNotifier {
  final FirestoreService _firestore = FirestoreService();

  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<void> loadUser(String uid) async {
    _currentUser = await _firestore.getUser(uid);
    notifyListeners();
  }

  Future<void> updateUser(Map<String, dynamic> data) async {
    if (_currentUser != null) {
      await _firestore.updateUser(_currentUser!.uid, data);
      _currentUser = User.fromMap({..._currentUser!.toMap(), ...data});
      notifyListeners();
    }
  }
}