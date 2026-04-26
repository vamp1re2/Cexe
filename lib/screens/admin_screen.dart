import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.currentUser;

    if (user?.role != 'admin' && user?.role != 'super_admin') {
      return Center(child: Text('Access Denied'));
    }

    return Scaffold(
      appBar: AppBar(title: Text('Admin Panel')),
      body: ListView(
        children: [
          ListTile(title: Text('Add Match'), onTap: () {}),
          ListTile(title: Text('View Logs'), onTap: () {}),
        ],
      ),
    );
  }
}