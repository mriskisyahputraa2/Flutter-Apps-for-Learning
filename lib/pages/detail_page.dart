import 'package:flutter/material.dart';
import '../models/book.dart';

class DetailPage extends StatelessWidget {
  // Kita menerima object Book (dari ListPage), bukan Map lagi
  final Book book;

  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          book.title,
          overflow: TextOverflow.ellipsis, // Agar judul panjang tidak error
        ),
        backgroundColor: Colors.deepPurple, // Menyesuaikan tema
        foregroundColor: Colors.white, // Warna teks header putih
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. HEADER: Icon Buku Besar (Pengganti Gambar)
            Center(
              child: Container(
                width: 120,
                height: 160,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.menu_book_rounded,
                  size: 64,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 32),

            // 2. JUDUL BUKU
            Text(
              book.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // 3. BADGE: Penulis & Tahun
            Row(
              children: [
                Chip(
                  avatar: const Icon(
                    Icons.person,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: Text(
                    book.author,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.blueGrey,
                ),
                const SizedBox(width: 10),
                Chip(
                  avatar: const Icon(
                    Icons.calendar_today,
                    size: 16,
                    color: Colors.white,
                  ),
                  label: Text(
                    book.publishedYear.toString(),
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.orange,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // 4. DESKRIPSI / SINOPSIS
            const Text(
              "Sinopsis / Deskripsi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100], // Background tipis agar rapi
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                book.description,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6, // Spasi antar baris agar enak dibaca
                  color: Colors.black87,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
