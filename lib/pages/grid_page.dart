import 'package:flutter/material.dart';
import '../models/book.dart'; // Import Model Book
import '../services/book_service.dart'; // Import Service API
import 'detail_page.dart';

class GridPage extends StatefulWidget {
  const GridPage({super.key});

  @override
  State<GridPage> createState() => _GridPageState();
}

class _GridPageState extends State<GridPage> {
  // Variable untuk menampung data masa depan (Future)
  late Future<List<Book>> _futureBooks;

  @override
  void initState() {
    super.initState();
    // Panggil API saat halaman dimuat
    _futureBooks = BookService().getBooks();
  }

  // Fungsi Refresh (Tarik ke bawah)
  Future<void> _refreshBooks() async {
    setState(() {
      _futureBooks = BookService().getBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Body menggunakan FutureBuilder untuk menangani Loading/Data/Error
      body: FutureBuilder<List<Book>>(
        future: _futureBooks,
        builder: (context, snapshot) {
          // 1. TAMPILAN LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. TAMPILAN ERROR
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 40),
                  const SizedBox(height: 8),
                  Text(
                    'Gagal memuat data:\n${snapshot.error}',
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: _refreshBooks,
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            );
          }

          // 3. TAMPILAN DATA KOSONG
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Belum ada buku tersedia."));
          }

          // 4. TAMPILAN DATA SUKSES (GRID)
          final books = snapshot.data!;

          return RefreshIndicator(
            onRefresh: _refreshBooks,
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: books.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 Kolom ke samping
                crossAxisSpacing: 12.0, // Jarak antar kolom
                mainAxisSpacing: 12.0, // Jarak antar baris
                childAspectRatio: 0.75, // Perbandingan Lebar : Tinggi kartu
              ),
              itemBuilder: (context, index) {
                final book = books[index];

                return Card(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      // NAVIGASI KE DETAIL PAGE (Kirim Object Book)
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(book: book),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // BAGIAN GAMBAR (Diganti Icon karena API Book belum ada gambar)
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors
                                  .deepPurple
                                  .shade50, // Background ungu muda
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12.0),
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.menu_book_rounded, // Icon Buku
                                size: 48,
                                color: Colors.deepPurple.shade300,
                              ),
                            ),
                          ),
                        ),

                        // BAGIAN TEXT (Judul & Penulis)
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Judul Buku
                              Text(
                                book.title,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2, // Maksimal 2 baris judul
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),

                              // Penulis
                              Text(
                                book.author,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),

                              const SizedBox(height: 8),

                              // Tahun Terbit
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.orange,
                                    size: 12,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    book.publishedYear.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.orange,
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
            ),
          );
        },
      ),
    );
  }
}
