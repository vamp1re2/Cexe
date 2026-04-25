import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../models/match.dart';
import '../models/prediction.dart';
import '../providers/auth_provider.dart';
import '../providers/user_provider.dart';
import '../services/firestore_service.dart';

class MatchCard extends StatefulWidget {
  final Match match;

  const MatchCard({super.key, required this.match});

  @override
  _MatchCardState createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  int scoreA = 0;
  int scoreB = 0;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    final firestore = FirestoreService();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(widget.match.teamAFlag, width: 40, height: 30),
                Text(widget.match.teamA),
                const Text('vs'),
                Text(widget.match.teamB),
                Image.network(widget.match.teamBFlag, width: 40, height: 30),
              ],
            ),
            Text(widget.match.matchStart.toString()),
            if (widget.match.status == 'upcoming' && widget.match.predictionDeadline.isAfter(DateTime.now())) ...[
              Row(
                children: [
                  DropdownButton<int>(
                    value: scoreA,
                    items: List.generate(21, (i) => DropdownMenuItem(value: i, child: Text('$i'))),
                    onChanged: (v) => setState(() => scoreA = v!),
                  ),
                  const Text(' - '),
                  DropdownButton<int>(
                    value: scoreB,
                    items: List.generate(21, (i) => DropdownMenuItem(value: i, child: Text('$i'))),
                    onChanged: (v) => setState(() => scoreB = v!),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  final prediction = Prediction(
                    id: '',
                    matchId: widget.match.id,
                    userId: authProvider.user!.uid,
                    username: userProvider.currentUser!.username,
                    scoreA: scoreA,
                    scoreB: scoreB,
                    points: 0,
                    timestamp: DateTime.now(),
                  );
                  await firestore.addPrediction(prediction);
                  Fluttertoast.showToast(msg: 'Prediction submitted');
                },
                child: const Text('Submit'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}