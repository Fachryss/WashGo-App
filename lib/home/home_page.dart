import 'package:flutter/material.dart';
import 'package:tugas_akhir/component/searchbar.dart';
import 'package:iconsax/iconsax.dart'; // Tambahkan library ikon modern

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 159, 243),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 3,
                spreadRadius: 2,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(25)),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: SearchBarWidget(
                searchController: _searchController,
                onClose: () {
                  setState(() {
                    _searchController.clear();
                  });
                },
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              // Bagian atas biru
              Expanded(
                flex: 2,
                child:
                    Container(color: const Color.fromARGB(255, 94, 182, 254)),
              ),

              // Bagian bawah putih
              Expanded(
                flex: 7,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          // Card di tengah antara biru & putih
          Positioned(
            top: MediaQuery.of(context).size.height * 0.12,
            left: MediaQuery.of(context).size.width * 0.05, // Diperlebar
            right: MediaQuery.of(context).size.width * 0.05, // Diperlebar
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Iconsax.wallet, color: Colors.blue, size: 45),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Saldo Anda",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Rp 1.000.000",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Ikon Kategori di Bawah Card
          Positioned(
            top: MediaQuery.of(context).size.height * 0.24,
            left: MediaQuery.of(context).size.width * 0.05,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryIcon(Icons.local_laundry_service, "Laundry"),
                    _buildCategoryIcon(Icons.shopping_bag, "Dry Cleaning"),
                    _buildCategoryIcon(Icons.cleaning_services, "Cleaning"),
                    _buildCategoryIcon(Icons.emoji_transportation, "Shoe Care"),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryIcon(Icons.iron, "Ironing"),
                    _buildCategoryIcon(Icons.directions_car, "Car Wash"),
                    _buildCategoryIcon(Icons.build, "Repair"),
                    _buildCategoryIcon(Icons.more_horiz, "More"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_2, size: 34), // Ukuran lebih besar
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting, size: 34), // Ukuran lebih besar
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  // Widget untuk ikon kategori
  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30, // Ukuran lebih besar
          backgroundColor: Colors.blueAccent.withOpacity(0.15),
          child: Icon(icon, color: Colors.blueAccent, size: 34),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
