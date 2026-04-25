import 'package:cloud_firestore/cloud_firestore.dart';

class Prediction {
  String id;
  String matchId;
  String userId;
  String username;
  int scoreA;
  int scoreB;
  int points;
  DateTime timestamp;

  Prediction({
    required this.id,
    required this.matchId,
    required this.userId,
    required this.username,
    required this.scoreA,
    required this.scoreB,
    required this.points,
    required this.timestamp,
  });

  factory Prediction.fromMap(String id, Map<String, dynamic> map) {
    return Prediction(
      id: id,
      matchId: map['matchId'],
      userId: map['userId'],
      username: map['username'],
      scoreA: map['scoreA'],
      scoreB: map['scoreB'],
      points: map['points'] ?? 0,
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'matchId': matchId,
      'userId': userId,
      'username': username,
      'scoreA': scoreA,
      'scoreB': scoreB,
      'points': points,
      'timestamp': timestamp,
    };
  }
}