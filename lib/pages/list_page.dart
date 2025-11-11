// lib/pages/list_page.dart
import 'package:flutter/material.dart';
import 'detail_page.dart';
// Tidak ada import database

class ListPage extends StatelessWidget {
  const ListPage({super.key});

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
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: _destinasiList.length,
      itemBuilder: (context, index) {
        final destinasi = _destinasiList[index];
        return Card(
          elevation: 2.0,
          margin: const EdgeInsets.only(bottom: 12.0),
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
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      destinasi['imageUrl']!,
                      width: 80,
                      height: 80,
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
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          destinasi['nama']!,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          destinasi['lokasi']!,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          destinasi['deskripsi']!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              destinasi['rating']!,
                              style: const TextStyle(
                                fontSize: 14,
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
          ),
        );
      },
    );
  }
}
