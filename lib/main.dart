import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'providers/auth_provider.dart';
import 'providers/user_provider.dart';
import 'providers/match_provider.dart';
import 'providers/leaderboard_provider.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => MatchProvider()),
        ChangeNotifierProvider(create: (_) => LeaderboardProvider()),
      ],
      child: MaterialApp(
        title: 'Allo Group Worldcup Foari 2026',
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: backgroundColor,
          cardColor: cardColor,
          primaryColor: textColor,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: textColor),
            bodyMedium: TextStyle(color: textColor),
            bodySmall: TextStyle(color: textColor),
          ),
          cardTheme: CardTheme(
            color: cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(color: borderColor),
            ),
          ),
          fontFamily: 'Inter',
        ),
        home: AuthWrapper(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.isLoggedIn) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.loadUser(authProvider.user!.uid);
      return HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}
