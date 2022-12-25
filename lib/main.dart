import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackquest/screens/welcome_screen.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

final String accountSid = 'ACb4cf88e58cb192edd990d56ffc944198';
final String authToken = 'a6c96a11c6bd6c5052d5d499873990c3';
final String fromPhoneNumber = '+17207828068';
final String toPhoneNumber = '+917009280622';
final String message = 'Hello from Flutter!';

TwilioFlutter twilioFlutter = TwilioFlutter(
  accountSid: accountSid, // replace *** with Account SID
  authToken: authToken, // replace xxx with Auth Token
  twilioNumber: fromPhoneNumber, // replace .... with Twilio Number
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
