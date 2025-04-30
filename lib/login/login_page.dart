// login_page.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas_akhir/home/home_page.dart';
import 'package:tugas_akhir/provider/auth_provider.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 75, 173, 249),
      body: Stack(
        children: [
          Positioned(
            top: 100,
            left: MediaQuery.of(context).size.width * 0.5 - 80,
            child: const CircleAvatar(
              radius: 80,
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: loadAuth.form,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Hi, Welcome Back!", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 25),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.person_outlined),
                          ),
                          onSaved: (value) => loadAuth.enteredEmail = value ?? '',
                          validator: (value) => (value == null || !value.contains('@')) ? 'Masukkan email yang valid' : null,
                        ),
                        const SizedBox(height: 15),
                        TextFormField(
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
                              onPressed: () => setState(() => _isObscure = !_isObscure),
                            ),
                          ),
                          onSaved: (value) => loadAuth.enteredPassword = value ?? '',
                          validator: (value) => (value == null || value.length < 6) ? 'Password minimal 6 karakter' : null,
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (loadAuth.form.currentState!.validate()) {
                                loadAuth.form.currentState!.save();
                                final success = await loadAuth.submit();
                                if (success && loadAuth.islogin) {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomePage()));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Login gagal')),
                                  );
                                }
                              }
                            },
                            child: const Text("Sign in"),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("Belum punya akun?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const RegisterPage()));
                                },
                                child: const Text("Daftar di sini"),
                              ),
                            ],
                          ),
                        )
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
