class User {
  String uid;
  String username;
  String role; // user, admin, super_admin
  int totalPoints;
  bool isBanned;

  User({
    required this.uid,
    required this.username,
    required this.role,
    required this.totalPoints,
    required this.isBanned,
  });

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      uid: map['uid'],
      username: map['username'],
      role: map['role'] ?? 'user',
      totalPoints: map['totalPoints'] ?? 0,
      isBanned: map['isBanned'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'role': role,
      'totalPoints': totalPoints,
      'isBanned': isBanned,
    };
  }
}