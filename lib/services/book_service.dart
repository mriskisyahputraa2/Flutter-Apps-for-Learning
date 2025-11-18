import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book.dart';
import 'config.dart'; // Import file config untuk URL otomatis

class BookService {
  // Helper: Ambil token dari HP
  Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  // GET: Ambil semua buku
  Future<List<Book>> getBooks() async {
    String? token = await _getToken();

    final response = await http.get(
      Uri.parse('${Config.baseUrl}/books'), // URL otomatis (Localhost/10.0.2.2)
      headers: {
        'Authorization': 'Bearer $token', // KUNCI: Kirim Token di sini
        'Accept': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Book.fromJson(data)).toList();
    } else {
      throw Exception('Gagal mengambil data buku: ${response.statusCode}');
    }
  }
}
