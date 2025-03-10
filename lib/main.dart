import 'package:flutter/material.dart';
import 'package:tugas_akhir/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (context) => LoginPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}
