// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  VegetableDao? _vegetableDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
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
            'CREATE TABLE IF NOT EXISTS `vegetable` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `image` TEXT NOT NULL, `buyingPrizePerKg` INTEGER NOT NULL, `salePrizePerKg` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `purchases` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `serialNum` TEXT, `releaseDate` TEXT, `sumOfVegetablePrize` REAL, `discount` REAL, `totalPrize` REAL, `verifyed` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `purchasedVegetables` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `purchaseId` INTEGER NOT NULL, `vegeID` INTEGER NOT NULL, `amount` REAL NOT NULL, `prize` REAL NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  VegetableDao get vegetableDao {
    return _vegetableDaoInstance ??= _$VegetableDao(database, changeListener);
  }
  
  @override
  // TODO: implement purchaseDao
  PurchaseDao get purchaseDao => throw UnimplementedError();
}

class _$VegetableDao extends VegetableDao {
  _$VegetableDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _vegetableInsertionAdapter = InsertionAdapter(
            database,
            'vegetable',
            (Vegetable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'buyingPrizePerKg': item.buyingPrizePerKg,
                  'salePrizePerKg': item.salePrizePerKg
                }),
        _vegetableUpdateAdapter = UpdateAdapter(
            database,
            'vegetable',
            ['id'],
            (Vegetable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'buyingPrizePerKg': item.buyingPrizePerKg,
                  'salePrizePerKg': item.salePrizePerKg
                }),
        _vegetableDeletionAdapter = DeletionAdapter(
            database,
            'vegetable',
            ['id'],
            (Vegetable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'buyingPrizePerKg': item.buyingPrizePerKg,
                  'salePrizePerKg': item.salePrizePerKg
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Vegetable> _vegetableInsertionAdapter;

  final UpdateAdapter<Vegetable> _vegetableUpdateAdapter;

  final DeletionAdapter<Vegetable> _vegetableDeletionAdapter;

  @override
  Future<List<Vegetable>> getAllVegetables() async {
    return _queryAdapter.queryList('SELECT * FROM vegetable',
        mapper: (Map<String, Object?> row) => Vegetable(
            id: row['id'] as int?,
            name: row['name'] as String,
            image: row['image'] as String,
            buyingPrizePerKg: row['buyingPrizePerKg'] as int,
            salePrizePerKg: row['salePrizePerKg'] as int));
  }

  @override
  Future<void> insertVegetable(Vegetable vege) async {
    await _vegetableInsertionAdapter.insert(vege, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateVegetable(Vegetable vege) async {
    await _vegetableUpdateAdapter.update(vege, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteVegetable(Vegetable vege) async {
    await _vegetableDeletionAdapter.delete(vege);
  }
  
  @override
  Future<List<Vegetable>> queryVegetable(String vegeName) {
    // TODO: implement queryVegetable
    throw UnimplementedError();
  }
}

// ignore_for_file: unused_element
final _vegetableTypeConverter = VegetableTypeConverter();
