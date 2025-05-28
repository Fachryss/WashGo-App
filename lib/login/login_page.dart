import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir/home/home_page.dart';
import 'package:tugas_akhir/provider/auth_provider.dart' as my_auth;
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<my_auth.AuthProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 76, 66, 212),
      body: Stack(
        children: [
          Positioned(
            top: 120,
            left: MediaQuery.of(context).size.width / 2 - 60,
            child: const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/images/laundry_logo.png'),
            ),
          ),
          Positioned.fill(
            top: 320,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: loadAuth.loginFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Hi, Welcome Back!",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),

                        // Email
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: const Icon(Icons.person_outlined),
                          ),
                          onSaved: (value) =>
                              loadAuth.enteredEmail = value ?? '',
                          validator: (value) =>
                              (value == null || !value.contains('@'))
                                  ? 'Masukkan email yang valid'
                                  : null,
                        ),
                        const SizedBox(height: 5),

                        // Password
                        TextFormField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                          ),
                          onSaved: (value) =>
                              loadAuth.enteredPassword = value ?? '',
                          validator: (value) =>
                              (value == null || value.length < 6)
                                  ? 'Password minimal 6 karakter'
                                  : null,
                        ),
                        const SizedBox(height: 10),

                        // Remember me
                        Row(
                          children: [
                            Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                            const Text('Remember me'),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text("Forgot password?"),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),

                        // Sign in button
                        Center(
                          child: SizedBox(
                            width: 270,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 76, 66, 212),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onPressed: () async {
                                if (loadAuth.loginFormKey.currentState!
                                    .validate()) {
                                  loadAuth.loginFormKey.currentState!.save();
                                  try {
                                    final success = await loadAuth.submit();
                                    if (success) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const HomePage(),
                                        ),
                                      );
                                    }
                                  } on FirebaseAuthException catch (e) {
                                    String message = 'Terjadi kesalahan';
                                    switch (e.code) {
                                      case 'user-not-found':
                                        message = 'Email tidak ditemukan';
                                        break;
                                      case 'wrong-password':
                                        message = 'Password salah';
                                        break;
                                      case 'invalid-credential':
                                        message = 'email atau password salah';
                                        break;
                                      case 'invalid-email':
                                        message = 'Email tidak valid';
                                        break;
                                      default:
                                        message = e.message ?? message;
                                    }

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text(message)),
                                    );
                                  } catch (_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text('Login gagal')),
                                    );
                                  }
                                }
                              },
                              child: const Text(
                                "Sign in",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Separator
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            SizedBox(width: 80, child: Divider(thickness: 1)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Text("Sign in with"),
                            ),
                            SizedBox(width: 80, child: Divider(thickness: 1)),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // Social Login
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () async {
                                try {
                                  await loadAuth.signInWithGoogle();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const HomePage(),
                                    ),
                                  );
                                } catch (_) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('Login dengan Google gagal')),
                                  );
                                }
                              },
                              icon: Image.asset('assets/images/google.png'),
                              iconSize: 40,
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/facebook.png'),
                              iconSize: 40,
                            ),
                            const SizedBox(width: 20),
                            IconButton(
                              onPressed: () {},
                              icon: Image.asset('assets/images/apple.png'),
                              iconSize: 40,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Sign up link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Don't have an account? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const RegisterPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 76, 66, 212),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
