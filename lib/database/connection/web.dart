import 'package:drift/web.dart';
import 'package:drift/drift.dart';

QueryExecutor openConnection() {
  return WebDatabase.withStorage(DriftWebStorage.indexedDb('db'));
}