import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  String? _verificationId;
  bool _isOtpSent = false;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            if (!_isOtpSent) ...[
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              ElevatedButton(
                onPressed: () async {
                  await authProvider.signInWithPhone(_phoneController.text, (id) {
                    setState(() {
                      _verificationId = id;
                      _isOtpSent = true;
                    });
                  });
                },
                child: Text('Send OTP'),
              ),
            ] else ...[
              TextField(
                controller: _otpController,
                decoration: InputDecoration(labelText: 'OTP'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () async {
                  await authProvider.verifyOTP(_verificationId!, _otpController.text);
                },
                child: Text('Verify'),
              ),
            ],
          ],
        ),
      ),
    );
  }
}