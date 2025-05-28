import 'package:flutter/material.dart';
import 'package:tugas_akhir/component/searchbar.dart';
import 'package:tugas_akhir/component/nearby_laundry_section.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SearchBarWidget(
                searchController: _searchController,
                onClose: () => _searchController.clear(),
              ),
            ),
            const SizedBox(height: 10),
            // Nearby laundry section tanpa judul, supaya rapi
            const Expanded(
              child: NearbyLaundrySection(showTitle: false),
            ),
          ],
        ),
      ),
    );
  }
}
