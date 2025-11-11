// lib/pages/detail_page.dart
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // Menerima data destinasi dari halaman sebelumnya (hanya Map statis)
  final Map<String, String> destinasi;

  const DetailPage({super.key, required this.destinasi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destinasi['nama']!),
        backgroundColor: Colors.deepPurple,
        // Tombol Edit (CRUD Update) Dihapus
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar destinasi yang diperbesar
            Image.network(
              destinasi['imageUrl']!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 250,
                  color: Colors.grey[300],
                  child: const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 50,
                      color: Colors.grey,
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nama destinasi
                  Text(
                    destinasi['nama']!,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Lokasi dan rating
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 20,
                        color: Colors.deepPurple,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        destinasi['lokasi']!,
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                      const Spacer(),
                      const Icon(Icons.star, size: 20, color: Colors.amber),
                      const SizedBox(width: 4),
                      Text(
                        destinasi['rating']!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  // Deskripsi
                  Text(
                    destinasi['deskripsi']!,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
