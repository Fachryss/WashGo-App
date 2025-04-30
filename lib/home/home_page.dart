import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:tugas_akhir/component/searchbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final TextEditingController _searchController = TextEditingController();

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 75, 173, 249),
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
                onClose: () => setState(() => _searchController.clear()),
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          // Layer putih di bawah
          Positioned.fill(
            top: 160,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  // Baris 1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildCategoryIcon(
                          Icons.local_laundry_service, "Laundry"),
                      _buildCategoryIcon(Icons.shopping_bag, "Dry Cleaning"),
                      _buildCategoryIcon(Icons.cleaning_services, "Cleaning"),
                      _buildCategoryIcon(
                          Icons.emoji_transportation, "Shoe Care"),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Baris 2
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
          ),

          // Card saldo di tengah
          Positioned(
            top: 110,
            left: 20,
            right: 20,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Iconsax.wallet, color: Colors.blue, size: 45),
                  const SizedBox(width: 10),
                  Column(
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
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home_2, size: 34),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.setting, size: 34),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blueAccent.withOpacity(0.15),
          child: Icon(icon, color: Colors.blueAccent, size: 34),
        ),
        const SizedBox(height: 5),
        Text(label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
