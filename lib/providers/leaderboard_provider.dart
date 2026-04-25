import 'dart:async';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/firestore_service.dart';

class LeaderboardProvider with ChangeNotifier {
  final FirestoreService _firestore = FirestoreService();

  List<User> _users = [];

  List<User> get users => _users;

  StreamSubscription? _subscription;

  LeaderboardProvider() {
    _subscription = _firestore.getLeaderboard().listen((users) {
      _users = users;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}