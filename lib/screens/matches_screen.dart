import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/match_provider.dart';
import '../widgets/match_card.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  _MatchesScreenState createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  DateTime _selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final matchProvider = Provider.of<MatchProvider>(context);
    final matches = matchProvider.matches.where((m) => m.matchStart.day == _selectedDate.day && m.matchStart.month == _selectedDate.month && m.matchStart.year == _selectedDate.year).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Matches'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () async {
              DateTime? picked = await showDatePicker(
                context: context,
                initialDate: _selectedDate,
                firstDate: DateTime(2026),
                lastDate: DateTime(2026, 12, 31),
              );
              if (picked != null) setState(() => _selectedDate = picked);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          return MatchCard(match: matches[index]);
        },
      ),
    );
  }
}