import 'package:flutter/foundation.dart';

class Config {
  //  Getter  dinamis untuk menentukan URL berdasarkan Platform

  static String get baseUrl {
    if (kIsWeb) {
      // Jika DI CHROME / WEB
      return 'http://127.0.0.1:8000/api';
    } else {
      // Jika di Android Emulator
      return 'http://10.0.2.2:8000/api';
    }
  }
}
