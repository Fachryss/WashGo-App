import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Ini adalah halaman Search', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
