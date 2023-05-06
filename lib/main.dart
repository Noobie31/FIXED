import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workforce/homepage.dart';

import 'login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool rememberMe = prefs.getBool('rememberMe') ?? false;
  runApp(MyApp(rememberMe));
}

class MyApp extends StatelessWidget {
  final bool rememberMe;
  const MyApp(this.rememberMe, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Workforce',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: rememberMe ? const HomePage() : const LoginPage());
  }
}
