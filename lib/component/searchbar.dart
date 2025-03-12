import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final VoidCallback onClose;

  const SearchBarWidget({
    Key? key,
    required this.searchController,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white, // Warna background
        borderRadius: BorderRadius.circular(20), // Ujung tumpul
        border: Border.all(color: Colors.grey.shade400), // Garis tepi
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.grey), // Ikon search
                contentPadding: EdgeInsets.symmetric(vertical: 10),
              ),
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
          ),
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.grey, size: 28), // Ikon akun
            onPressed: () {
              // Tambahkan fungsi untuk navigasi atau aksi lain
              print("Akun diklik!");
            },
          ),
        ],
      ),
    );
  }
}
