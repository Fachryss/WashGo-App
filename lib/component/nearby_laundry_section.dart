import 'package:flutter/material.dart';


class NearbyLaundrySection extends StatelessWidget {
  final bool showTitle;
  const NearbyLaundrySection({super.key, this.showTitle = true});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showTitle)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Laundry Terdekat",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                // Rating di kanan atas, ganti icon lokasi
                Row(
                  children: const [
                    Icon(Icons.star, size: 18, color: Colors.orange),
                    SizedBox(width: 4),
                    Text("4.5", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        if (showTitle) const SizedBox(height: 10),
        ListView.builder(
          itemCount: 3,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.only(bottom: 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundImage:
                      AssetImage('assets/images/laundry${index + 1}.png'),
                  backgroundColor: Colors.transparent,
                ),
                title: Text("Laundry Express ${index + 1}"),
                subtitle: Row(
                  children: [
                    const Icon(Icons.location_on_outlined,
                        size: 16, color: Colors.grey),
                    const SizedBox(width: 4),
                    Text("Jl. Sudirman No. ${index + 1}"),
                  ],
                ),
                // Kalau mau rating di setiap item juga di kanan, bisa pakai trailing:
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.star, size: 16, color: Colors.orange),
                    Text("4.${index + 2}"),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
