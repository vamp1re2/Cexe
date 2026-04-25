import 'package:cloud_firestore/cloud_firestore.dart';

class Log {
  String action;
  String performedBy;
  DateTime timestamp;

  Log({required this.action, required this.performedBy, required this.timestamp});

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      action: map['action'],
      performedBy: map['performedBy'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'action': action,
      'performedBy': performedBy,
      'timestamp': timestamp,
    };
  }
}