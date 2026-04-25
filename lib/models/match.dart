import 'package:cloud_firestore/cloud_firestore.dart';

class Match {
  String id;
  String teamA;
  String teamB;
  String teamAFlag;
  String teamBFlag;
  DateTime matchStart;
  DateTime predictionDeadline;
  int? scoreA;
  int? scoreB;
  String status; // upcoming, live, finished

  Match({
    required this.id,
    required this.teamA,
    required this.teamB,
    required this.teamAFlag,
    required this.teamBFlag,
    required this.matchStart,
    required this.predictionDeadline,
    this.scoreA,
    this.scoreB,
    required this.status,
  });

  factory Match.fromMap(String id, Map<String, dynamic> map) {
    return Match(
      id: id,
      teamA: map['teamA'],
      teamB: map['teamB'],
      teamAFlag: map['teamAFlag'],
      teamBFlag: map['teamBFlag'],
      matchStart: (map['matchStart'] as Timestamp).toDate(),
      predictionDeadline: (map['predictionDeadline'] as Timestamp).toDate(),
      scoreA: map['scoreA'],
      scoreB: map['scoreB'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'teamA': teamA,
      'teamB': teamB,
      'teamAFlag': teamAFlag,
      'teamBFlag': teamBFlag,
      'matchStart': matchStart,
      'predictionDeadline': predictionDeadline,
      'scoreA': scoreA,
      'scoreB': scoreB,
      'status': status,
    };
  }
}