import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // tambahkan ini
import '../login/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tugas_akhir/home/home_page.dart';
import 'firebase_options.dart';
import 'package:tugas_akhir/provider/auth_provider.dart'; // pastikan import AuthProvider

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
        ChangeNotifierProvider(
            create: (_) => AuthProvider()), // daftar AuthProvider di sini
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
