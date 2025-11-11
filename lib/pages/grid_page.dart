import 'package:flutter/material.dart';
import 'detail_page.dart';

class GridPage extends StatelessWidget {
  const GridPage({super.key});

  // Data dikembalikan ke statis (hardcoded)
  static final List<Map<String, String>> _destinasiList = [
    {
      "nama": "Pulau Komodo",
      "lokasi": "Nusa Tenggara Timur",
      "deskripsi": "Habitat asli komodo, kadal terbesar di dunia.",
      "rating": "4.8",
      "imageUrl":
          "https://plus.unsplash.com/premium_photo-1668883189361-9c754861dbd6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1074",
    },
    {
      "nama": "Raja Ampat",
      "lokasi": "Papua Barat",
      "deskripsi":
          "Keindahan bawah laut terbaik dengan keanekaragaman hayati tinggi.",
      "rating": "5.0",
      "imageUrl":
          "https://images.unsplash.com/photo-1703769605297-cc74106244d9?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1184",
    },
    {
      "nama": "Danau Toba",
      "lokasi": "Sumatera Utara",
      "deskripsi":
          "Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir di tengahnya.",
      "rating": "4.7",
      "imageUrl":
          "https://images.unsplash.com/photo-1601058497548-f247dfe349d6?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1170",
    },
    {
      "nama": "Gunung Bromo",
      "lokasi": "Jawa Timur",
      "deskripsi":
          "Pemandangan matahari terbit yang spektakuler dengan kawah aktif.",
      "rating": "4.9",
      "imageUrl":
          "https://images.unsplash.com/photo-1602154663343-89fe0bf541ab?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1631",
    },
    {
      "nama": "Candi Borobudur",
      "lokasi": "Jawa Tengah",
      "deskripsi": "Candi Buddha terbesar di dunia, situs warisan UNESCO.",
      "rating": "4.9",
      "imageUrl":
          "https://images.unsplash.com/photo-1578469550956-0e16b69c6a3d?ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&q=80&w=1106",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _destinasiList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final destinasi = _destinasiList[index];
        return Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(destinasi: destinasi),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(12.0),
                    ),
                    child: Image.network(
                      destinasi['imageUrl']!,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[300],
                          child: const Icon(
                            Icons.broken_image,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        destinasi['nama']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        destinasi['lokasi']!,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.amber, size: 14),
                          const SizedBox(width: 4),
                          Text(
                            destinasi['rating']!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
