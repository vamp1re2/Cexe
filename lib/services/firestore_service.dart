import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
import '../models/match.dart';
import '../models/prediction.dart';
import '../models/log.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Users
  Future<User?> getUser(String uid) async {
    DocumentSnapshot doc = await _db.collection('users').doc(uid).get();
    if (doc.exists) {
      return User.fromMap(doc.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> createUser(User user) async {
    await _db.collection('users').doc(user.uid).set(user.toMap());
  }

  Stream<List<User>> getLeaderboard() {
    return _db.collection('users').orderBy('totalPoints', descending: true).snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => User.fromMap(doc.data())).toList(),
    );
  }

  Future<void> updateUser(String uid, Map<String, dynamic> data) async {
    await _db.collection('users').doc(uid).update(data);
  }

  // Matches
  Stream<List<Match>> getMatches() {
    return _db.collection('matches').snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => Match.fromMap(doc.id, doc.data())).toList(),
    );
  }

  Future<void> addMatch(Match match) async {
    await _db.collection('matches').add(match.toMap());
  }

  Future<void> updateMatch(String id, Map<String, dynamic> data) async {
    await _db.collection('matches').doc(id).update(data);
  }

  Future<void> deleteMatch(String id) async {
    await _db.collection('matches').doc(id).delete();
  }

  // Predictions
  Stream<List<Prediction>> getPredictionsForMatch(String matchId) {
    return _db.collection('predictions').where('matchId', isEqualTo: matchId).snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => Prediction.fromMap(doc.id, doc.data())).toList(),
    );
  }

  Future<Prediction?> getUserPrediction(String matchId, String userId) async {
    QuerySnapshot snapshot = await _db.collection('predictions')
      .where('matchId', isEqualTo: matchId)
      .where('userId', isEqualTo: userId)
      .get();
    if (snapshot.docs.isNotEmpty) {
      return Prediction.fromMap(snapshot.docs.first.id, snapshot.docs.first.data() as Map<String, dynamic>);
    }
    return null;
  }

  Future<void> addPrediction(Prediction prediction) async {
    await _db.collection('predictions').add(prediction.toMap());
  }

  Future<void> updatePrediction(String id, Map<String, dynamic> data) async {
    await _db.collection('predictions').doc(id).update(data);
  }

  // Logs
  Future<void> addLog(Log log) async {
    await _db.collection('logs').add(log.toMap());
  }

  Stream<List<Log>> getLogs() {
    return _db.collection('logs').orderBy('timestamp', descending: true).snapshots().map(
      (snapshot) => snapshot.docs.map((doc) => Log.fromMap(doc.data())).toList(),
    );
  }
}