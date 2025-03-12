import 'package:flutter/material.dart';
import 'package:tugas_akhir/login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugas_akhir/home/home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => HomePage()},
      debugShowCheckedModeBanner: false,
    );
  }
}
