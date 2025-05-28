import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh data profil statis
    const String name = "John Doe";
    const String email = "john.doe@example.com";
    const String address = "Jl. Merdeka No. 123, Jakarta";
    const String password = "password123"; // akan ditampilkan sebagai ******

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Foto Profil
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  'assets/images/profile.jpg'), // ganti dengan gambar profil Anda
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(height: 20),

            // Nama
            Row(
              children: const [
                Icon(Icons.person, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text('Nama:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(name, style: const TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 10),

            // Email
            Row(
              children: const [
                Icon(Icons.email, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text('Email:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(email, style: const TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 10),

            // Alamat
            Row(
              children: const [
                Icon(Icons.location_on, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text('Alamat:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(address, style: const TextStyle(fontSize: 16)),
            ),

            const SizedBox(height: 10),

            // Password
            Row(
              children: const [
                Icon(Icons.lock, color: Colors.blueAccent),
                SizedBox(width: 10),
                Text('Password:',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Text(
                '*' * password.length, // tampilkan password sebagai bintang
                style: const TextStyle(fontSize: 16, letterSpacing: 2),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
