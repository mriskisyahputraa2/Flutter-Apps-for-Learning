// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DestinationsTable extends Destinations
    with TableInfo<$DestinationsTable, Destination> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DestinationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _namaMeta = const VerificationMeta('nama');
  @override
  late final GeneratedColumn<String> nama = GeneratedColumn<String>(
    'nama',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lokasiMeta = const VerificationMeta('lokasi');
  @override
  late final GeneratedColumn<String> lokasi = GeneratedColumn<String>(
    'lokasi',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _deskripsiMeta = const VerificationMeta(
    'deskripsi',
  );
  @override
  late final GeneratedColumn<String> deskripsi = GeneratedColumn<String>(
    'deskripsi',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ratingMeta = const VerificationMeta('rating');
  @override
  late final GeneratedColumn<double> rating = GeneratedColumn<double>(
    'rating',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    nama,
    lokasi,
    deskripsi,
    rating,
    imageUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'destinations';
  @override
  VerificationContext validateIntegrity(
    Insertable<Destination> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('nama')) {
      context.handle(
        _namaMeta,
        nama.isAcceptableOrUnknown(data['nama']!, _namaMeta),
      );
    } else if (isInserting) {
      context.missing(_namaMeta);
    }
    if (data.containsKey('lokasi')) {
      context.handle(
        _lokasiMeta,
        lokasi.isAcceptableOrUnknown(data['lokasi']!, _lokasiMeta),
      );
    } else if (isInserting) {
      context.missing(_lokasiMeta);
    }
    if (data.containsKey('deskripsi')) {
      context.handle(
        _deskripsiMeta,
        deskripsi.isAcceptableOrUnknown(data['deskripsi']!, _deskripsiMeta),
      );
    } else if (isInserting) {
      context.missing(_deskripsiMeta);
    }
    if (data.containsKey('rating')) {
      context.handle(
        _ratingMeta,
        rating.isAcceptableOrUnknown(data['rating']!, _ratingMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Destination map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Destination(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      nama: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nama'],
      )!,
      lokasi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lokasi'],
      )!,
      deskripsi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}deskripsi'],
      )!,
      rating: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}rating'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
    );
  }

  @override
  $DestinationsTable createAlias(String alias) {
    return $DestinationsTable(attachedDatabase, alias);
  }
}

class Destination extends DataClass implements Insertable<Destination> {
  final int id;
  final String nama;
  final String lokasi;
  final String deskripsi;
  final double rating;
  final String? imageUrl;
  const Destination({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.deskripsi,
    required this.rating,
    this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['nama'] = Variable<String>(nama);
    map['lokasi'] = Variable<String>(lokasi);
    map['deskripsi'] = Variable<String>(deskripsi);
    map['rating'] = Variable<double>(rating);
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    return map;
  }

  DestinationsCompanion toCompanion(bool nullToAbsent) {
    return DestinationsCompanion(
      id: Value(id),
      nama: Value(nama),
      lokasi: Value(lokasi),
      deskripsi: Value(deskripsi),
      rating: Value(rating),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
    );
  }

  factory Destination.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Destination(
      id: serializer.fromJson<int>(json['id']),
      nama: serializer.fromJson<String>(json['nama']),
      lokasi: serializer.fromJson<String>(json['lokasi']),
      deskripsi: serializer.fromJson<String>(json['deskripsi']),
      rating: serializer.fromJson<double>(json['rating']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'nama': serializer.toJson<String>(nama),
      'lokasi': serializer.toJson<String>(lokasi),
      'deskripsi': serializer.toJson<String>(deskripsi),
      'rating': serializer.toJson<double>(rating),
      'imageUrl': serializer.toJson<String?>(imageUrl),
    };
  }

  Destination copyWith({
    int? id,
    String? nama,
    String? lokasi,
    String? deskripsi,
    double? rating,
    Value<String?> imageUrl = const Value.absent(),
  }) => Destination(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    lokasi: lokasi ?? this.lokasi,
    deskripsi: deskripsi ?? this.deskripsi,
    rating: rating ?? this.rating,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
  );
  Destination copyWithCompanion(DestinationsCompanion data) {
    return Destination(
      id: data.id.present ? data.id.value : this.id,
      nama: data.nama.present ? data.nama.value : this.nama,
      lokasi: data.lokasi.present ? data.lokasi.value : this.lokasi,
      deskripsi: data.deskripsi.present ? data.deskripsi.value : this.deskripsi,
      rating: data.rating.present ? data.rating.value : this.rating,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Destination(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('lokasi: $lokasi, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('rating: $rating, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, nama, lokasi, deskripsi, rating, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Destination &&
          other.id == this.id &&
          other.nama == this.nama &&
          other.lokasi == this.lokasi &&
          other.deskripsi == this.deskripsi &&
          other.rating == this.rating &&
          other.imageUrl == this.imageUrl);
}

class DestinationsCompanion extends UpdateCompanion<Destination> {
  final Value<int> id;
  final Value<String> nama;
  final Value<String> lokasi;
  final Value<String> deskripsi;
  final Value<double> rating;
  final Value<String?> imageUrl;
  const DestinationsCompanion({
    this.id = const Value.absent(),
    this.nama = const Value.absent(),
    this.lokasi = const Value.absent(),
    this.deskripsi = const Value.absent(),
    this.rating = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  DestinationsCompanion.insert({
    this.id = const Value.absent(),
    required String nama,
    required String lokasi,
    required String deskripsi,
    this.rating = const Value.absent(),
    this.imageUrl = const Value.absent(),
  }) : nama = Value(nama),
       lokasi = Value(lokasi),
       deskripsi = Value(deskripsi);
  static Insertable<Destination> custom({
    Expression<int>? id,
    Expression<String>? nama,
    Expression<String>? lokasi,
    Expression<String>? deskripsi,
    Expression<double>? rating,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (nama != null) 'nama': nama,
      if (lokasi != null) 'lokasi': lokasi,
      if (deskripsi != null) 'deskripsi': deskripsi,
      if (rating != null) 'rating': rating,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  DestinationsCompanion copyWith({
    Value<int>? id,
    Value<String>? nama,
    Value<String>? lokasi,
    Value<String>? deskripsi,
    Value<double>? rating,
    Value<String?>? imageUrl,
  }) {
    return DestinationsCompanion(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      lokasi: lokasi ?? this.lokasi,
      deskripsi: deskripsi ?? this.deskripsi,
      rating: rating ?? this.rating,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (nama.present) {
      map['nama'] = Variable<String>(nama.value);
    }
    if (lokasi.present) {
      map['lokasi'] = Variable<String>(lokasi.value);
    }
    if (deskripsi.present) {
      map['deskripsi'] = Variable<String>(deskripsi.value);
    }
    if (rating.present) {
      map['rating'] = Variable<double>(rating.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DestinationsCompanion(')
          ..write('id: $id, ')
          ..write('nama: $nama, ')
          ..write('lokasi: $lokasi, ')
          ..write('deskripsi: $deskripsi, ')
          ..write('rating: $rating, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DestinationsTable destinations = $DestinationsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [destinations];
}

typedef $$DestinationsTableCreateCompanionBuilder =
    DestinationsCompanion Function({
      Value<int> id,
      required String nama,
      required String lokasi,
      required String deskripsi,
      Value<double> rating,
      Value<String?> imageUrl,
    });
typedef $$DestinationsTableUpdateCompanionBuilder =
    DestinationsCompanion Function({
      Value<int> id,
      Value<String> nama,
      Value<String> lokasi,
      Value<String> deskripsi,
      Value<double> rating,
      Value<String?> imageUrl,
    });

class $$DestinationsTableFilterComposer
    extends Composer<_$AppDatabase, $DestinationsTable> {
  $$DestinationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lokasi => $composableBuilder(
    column: $table.lokasi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DestinationsTableOrderingComposer
    extends Composer<_$AppDatabase, $DestinationsTable> {
  $$DestinationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nama => $composableBuilder(
    column: $table.nama,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lokasi => $composableBuilder(
    column: $table.lokasi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get deskripsi => $composableBuilder(
    column: $table.deskripsi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get rating => $composableBuilder(
    column: $table.rating,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DestinationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DestinationsTable> {
  $$DestinationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get nama =>
      $composableBuilder(column: $table.nama, builder: (column) => column);

  GeneratedColumn<String> get lokasi =>
      $composableBuilder(column: $table.lokasi, builder: (column) => column);

  GeneratedColumn<String> get deskripsi =>
      $composableBuilder(column: $table.deskripsi, builder: (column) => column);

  GeneratedColumn<double> get rating =>
      $composableBuilder(column: $table.rating, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);
}

class $$DestinationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DestinationsTable,
          Destination,
          $$DestinationsTableFilterComposer,
          $$DestinationsTableOrderingComposer,
          $$DestinationsTableAnnotationComposer,
          $$DestinationsTableCreateCompanionBuilder,
          $$DestinationsTableUpdateCompanionBuilder,
          (
            Destination,
            BaseReferences<_$AppDatabase, $DestinationsTable, Destination>,
          ),
          Destination,
          PrefetchHooks Function()
        > {
  $$DestinationsTableTableManager(_$AppDatabase db, $DestinationsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DestinationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DestinationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DestinationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> nama = const Value.absent(),
                Value<String> lokasi = const Value.absent(),
                Value<String> deskripsi = const Value.absent(),
                Value<double> rating = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => DestinationsCompanion(
                id: id,
                nama: nama,
                lokasi: lokasi,
                deskripsi: deskripsi,
                rating: rating,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String nama,
                required String lokasi,
                required String deskripsi,
                Value<double> rating = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
              }) => DestinationsCompanion.insert(
                id: id,
                nama: nama,
                lokasi: lokasi,
                deskripsi: deskripsi,
                rating: rating,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DestinationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DestinationsTable,
      Destination,
      $$DestinationsTableFilterComposer,
      $$DestinationsTableOrderingComposer,
      $$DestinationsTableAnnotationComposer,
      $$DestinationsTableCreateCompanionBuilder,
      $$DestinationsTableUpdateCompanionBuilder,
      (
        Destination,
        BaseReferences<_$AppDatabase, $DestinationsTable, Destination>,
      ),
      Destination,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DestinationsTableTableManager get destinations =>
      $$DestinationsTableTableManager(_db, _db.destinations);
}
