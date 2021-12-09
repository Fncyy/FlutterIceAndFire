// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'floor_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorFloorIceAndFireDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorIceAndFireDatabaseBuilder databaseBuilder(String name) =>
      _$FloorIceAndFireDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$FloorIceAndFireDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$FloorIceAndFireDatabaseBuilder(null);
}

class _$FloorIceAndFireDatabaseBuilder {
  _$FloorIceAndFireDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$FloorIceAndFireDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$FloorIceAndFireDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<FloorIceAndFireDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$FloorIceAndFireDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$FloorIceAndFireDatabase extends FloorIceAndFireDatabase {
  _$FloorIceAndFireDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  FloorBookDao? _bookDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `books` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `isbn` TEXT NOT NULL, `numberOfPages` INTEGER NOT NULL, `publisher` TEXT NOT NULL, `country` TEXT NOT NULL, `mediaType` TEXT NOT NULL, `released` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `bookAuthors` (`name` TEXT NOT NULL, `bookId` INTEGER NOT NULL, PRIMARY KEY (`name`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `bookPovCharacters` (`id` INTEGER NOT NULL, `bookId` INTEGER NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  FloorBookDao get bookDao {
    return _bookDaoInstance ??= _$FloorBookDao(database, changeListener);
  }
}

class _$FloorBookDao extends FloorBookDao {
  _$FloorBookDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _floorBookInsertionAdapter = InsertionAdapter(
            database,
            'books',
            (FloorBook item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'isbn': item.isbn,
                  'numberOfPages': item.numberOfPages,
                  'publisher': item.publisher,
                  'country': item.country,
                  'mediaType': item.mediaType,
                  'released': item.released
                }),
        _floorBookAuthorInsertionAdapter = InsertionAdapter(
            database,
            'bookAuthors',
            (FloorBookAuthor item) =>
                <String, Object?>{'name': item.name, 'bookId': item.bookId}),
        _floorBookPovCharacterInsertionAdapter = InsertionAdapter(
            database,
            'bookPovCharacters',
            (FloorBookPovCharacter item) =>
                <String, Object?>{'id': item.id, 'bookId': item.bookId});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<FloorBook> _floorBookInsertionAdapter;

  final InsertionAdapter<FloorBookAuthor> _floorBookAuthorInsertionAdapter;

  final InsertionAdapter<FloorBookPovCharacter>
      _floorBookPovCharacterInsertionAdapter;

  @override
  Future<FloorBook?> getBook(int id) async {
    return _queryAdapter.query('SELECT * FROM books WHERE id = ?1',
        mapper: (Map<String, Object?> row) => FloorBook(
            row['id'] as int,
            row['name'] as String,
            row['isbn'] as String,
            row['numberOfPages'] as int,
            row['publisher'] as String,
            row['country'] as String,
            row['mediaType'] as String,
            row['released'] as String),
        arguments: [id]);
  }

  @override
  Future<List<FloorBookAuthor>> getBookAuthors(int bookId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM bookAuthors WHERE bookId = ?1',
        mapper: (Map<String, Object?> row) =>
            FloorBookAuthor(row['name'] as String, row['bookId'] as int),
        arguments: [bookId]);
  }

  @override
  Future<List<FloorBookPovCharacter>> getBookPovCharacters(int bookId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM bookPovCharacters WHERE bookId = ?1',
        mapper: (Map<String, Object?> row) =>
            FloorBookPovCharacter(row['id'] as int, row['bookId'] as int),
        arguments: [bookId]);
  }

  @override
  Future<void> insertBooks(List<FloorBook> books) async {
    await _floorBookInsertionAdapter.insertList(
        books, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertBook(FloorBook book) async {
    await _floorBookInsertionAdapter.insert(book, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertBookAuthors(List<FloorBookAuthor> bookAuthors) async {
    await _floorBookAuthorInsertionAdapter.insertList(
        bookAuthors, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertBookPovCharacters(
      List<FloorBookPovCharacter> bookPovCharacters) async {
    await _floorBookPovCharacterInsertionAdapter.insertList(
        bookPovCharacters, OnConflictStrategy.abort);
  }
}
