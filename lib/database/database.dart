// lib/database/database.dart
import 'package:drift/drift.dart';

// Import the connection logic based on the platform.
import 'connection/unsupported.dart'
    if (dart.library.html) 'connection/web.dart'
    if (dart.library.io) 'connection/native.dart';

part 'database.g.dart';

// Definisikan Tabel Destinasi
class Destinations extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nama => text().withLength(min: 1, max: 100)();
  TextColumn get lokasi => text().withLength(min: 1, max: 100)();
  TextColumn get deskripsi => text().withLength(min: 1, max: 500)();
  RealColumn get rating => real().withDefault(const Constant(0.0))();
  TextColumn get imageUrl => text().nullable()(); // URL bisa null
}

// Annotasi utama database
@DriftDatabase(tables: [Destinations])
class AppDatabase extends _$AppDatabase {
  // The constructor now calls the conditionally-imported `openConnection` function.
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 1;

  // --- OPERASI CRUD UTAMA ---

  Stream<List<Destination>> watchAllDestinations() =>
      select(destinations).watch();

  Future<int> createDestination(DestinationsCompanion entry) {
    return into(destinations).insert(entry);
  }

  Future<bool> updateDestination(DestinationsCompanion entry) {
    return (update(destinations)..where((t) => t.id.equals(entry.id.value)))
        .write(entry)
        .then((rows) => rows > 0);
  }

  Future<int> deleteDestination(int id) {
    return (delete(destinations)..where((t) => t.id.equals(id))).go();
  }
}

// Tambahkan data awal agar aplikasi tidak kosong saat pertama dijalankan
// Ini akan dipanggil di main.dart
Future<void> initializeDatabase(AppDatabase db) async {
  if (await db.destinationExists()) {
    return; // Data sudah ada, jangan masukkan lagi
  }

  // Definisikan data awal
  final initialData = [
    DestinationsCompanion.insert(
      nama: 'Pulau Komodo',
      lokasi: 'Nusa Tenggara Timur',
      deskripsi: 'Habitat asli komodo, kadal terbesar di dunia.',
      rating: Value(4.8),
      imageUrl: Value(
        'https://plus.unsplash.com/premium_photo-1668883189361-9c754861dbd6?ixlib=rb-4.1.0&q=80&w=1074',
      ),
    ),
    DestinationsCompanion.insert(
      nama: 'Raja Ampat',
      lokasi: 'Papua Barat',
      deskripsi:
          'Keindahan bawah laut terbaik dengan keanekaragaman hayati tinggi.',
      rating: Value(5.0),
      imageUrl: Value(
        'https://images.unsplash.com/photo-1703769605297-cc74106244d9?ixlib=rb-4.1.0&q=80&w=1184',
      ),
    ),
    // Anda bisa tambahkan data lainnya di sini
  ];

  for (final data in initialData) {
    await db.createDestination(data);
  }
}

// Extension untuk mengecek apakah tabel sudah terisi
extension on AppDatabase {
  Future<bool> destinationExists() async {
    return (await select(destinations).get()).isNotEmpty;
  }
}