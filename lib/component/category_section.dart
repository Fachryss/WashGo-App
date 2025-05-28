import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  const CategorySection({super.key});

  Widget _buildCategoryIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 10),
        CircleAvatar(
          radius: 30,
          backgroundColor: const Color.fromARGB(255, 76, 66, 212),
          child: Icon(icon, color: Colors.white, size: 34),
        ),
        const SizedBox(height: 5),
        Text(label,
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Tetapkan lebar yang sama untuk tiap kolom supaya posisi vertikal rata
    const double itemWidth = 80;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: itemWidth,
                child: _buildCategoryIcon(
                    Icons.local_laundry_service_outlined, "Laundry")),
            SizedBox(
                width: itemWidth,
                child: _buildCategoryIcon(
                    Icons.shopping_bag_outlined, "Dry Clean")),
            SizedBox(
                width: itemWidth,
                child: _buildCategoryIcon(Icons.iron, "Ironing")),
            SizedBox(
                width: itemWidth,
                child: _buildCategoryIcon(Icons.checkroom, "Shoe Care")),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                width: itemWidth,
                child: _buildCategoryIcon(Icons.bed_outlined, "Bed Linen")),
            SizedBox(
                width: itemWidth,
                child: _buildCategoryIcon(Icons.backpack, "Bag Clean")),
            SizedBox(
                width: itemWidth,
                child: _buildCategoryIcon(Icons.flash_on_outlined, "Express")),
            SizedBox(
                width: itemWidth,
                child: _buildCategoryIcon(Icons.more_horiz, "More")),
          ],
        ),
      ],
    );
  }
}
