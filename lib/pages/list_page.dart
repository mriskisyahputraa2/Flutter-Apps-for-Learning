import 'package:flutter/material.dart';
import '../models/book.dart'; // Import Model
import '../services/book_service.dart'; // Import Service
import 'detail_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  late Future<List<Book>> _futureBooks;

  @override
  void initState() {
    super.initState();
    // Panggil API saat halaman pertama kali dibuka
    _futureBooks = BookService().getBooks();
  }

  // Fungsi untuk Refresh (Tarik layar ke bawah)
  Future<void> _refreshBooks() async {
    setState(() {
      _futureBooks = BookService().getBooks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Book>>(
        future: _futureBooks,
        builder: (context, snapshot) {
          // 1. KONDISI LOADING
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // 2. KONDISI ERROR
          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    'Gagal memuat data\n${snapshot.error}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _refreshBooks,
                    child: const Text("Coba Lagi"),
                  ),
                ],
              ),
            );
          }

          // 3. KONDISI DATA KOSONG
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Belum ada buku tersedia"));
          }

          // 4. KONDISI ADA DATA (SUCCESS)
          final books = snapshot.data!;

          return RefreshIndicator(
            onRefresh: _refreshBooks,
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Card(
                  elevation: 2.0,
                  margin: const EdgeInsets.only(bottom: 12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Kirim Object Book ke DetailPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(book: book),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Ikon Buku (Pengganti Gambar)
                          Container(
                            width: 60,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.menu_book_rounded,
                                color: Colors.deepPurple,
                                size: 32,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          // Informasi Buku
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: const TextStyle(
                                    fontSize:
                                        16, // Sedikit dikecilkan agar muat
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "Penulis: ${book.author}",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      size: 14,
                                      color: Colors.orange,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      book.publishedYear.toString(),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
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
