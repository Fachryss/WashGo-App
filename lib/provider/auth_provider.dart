import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';

final _fireAuth = FirebaseAuth.instance;

class AuthProvider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  bool islogin = true;
  String enteredEmail = '';
  String enteredPassword = '';

  void toggle() {
    islogin = !islogin;
    notifyListeners();
  }

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) return; // user cancel

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<bool> submit() async {
    try {
      if (islogin) {
        // Login
        final result = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPassword,
        );

        // Cek di Firestore apakah user ada
        final userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(result.user!.uid)
            .get();

        if (!userDoc.exists) {
          throw Exception('User tidak ditemukan di database');
        }

        return true;
      } else {
        // Register
        final result =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: enteredEmail,
          password: enteredPassword,
        );

        // Tambahkan ke Firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(result.user!.uid)
            .set({
          'email': enteredEmail,
          // tambahkan data lain yang dibutuhkan
        });

        return true;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        throw Exception('Email atau password salah');
      } else if (e.code == 'invalid-credential') {
        throw Exception('Kredensial login tidak valid atau sudah kadaluarsa');
      } else {
        throw Exception(e.message ?? 'Terjadi kesalahan');
      }
    }
  }
}
