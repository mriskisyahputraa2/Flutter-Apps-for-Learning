class Book {
  final int id;
  final String title;
  final String author;
  final String description;
  final int publishedYear;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.publishedYear,
  });

  // === BAGIAN INI YANG KEMUNGKINAN HILANG/SALAH ===
  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      description: json['description'] ?? '-',
      // Pastikan parsing int aman
      publishedYear: int.tryParse(json['published_year'].toString()) ?? 0,
    );
  }
}
