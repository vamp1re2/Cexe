import 'dart:async';
import 'package:flutter/material.dart';
import '../models/match.dart';
import '../services/firestore_service.dart';

class MatchProvider with ChangeNotifier {
  final FirestoreService _firestore = FirestoreService();

  List<Match> _matches = [];

  List<Match> get matches => _matches;

  StreamSubscription? _subscription;

  MatchProvider() {
    _subscription = _firestore.getMatches().listen((matches) {
      _matches = matches;
      notifyListeners();
    });
  }

  Future<void> addMatch(Match match) async {
    await _firestore.addMatch(match);
  }

  Future<void> updateMatch(String id, Map<String, dynamic> data) async {
    await _firestore.updateMatch(id, data);
  }

  Future<void> deleteMatch(String id) async {
    await _firestore.deleteMatch(id);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}