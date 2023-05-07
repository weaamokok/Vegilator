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

  PurchaseDao? _purchaseDaoInstance;

  PurchasedVegetablesDao? _purchasedVegetablesDaoInstance;

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
            'CREATE TABLE IF NOT EXISTS `Vegetables` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `name` TEXT NOT NULL, `image` TEXT NOT NULL, `buyingPrizePerKg` INTEGER NOT NULL, `salePrizePerKg` INTEGER NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `purchases` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `serialNum` TEXT, `releaseDate` TEXT, `sumOfVegetablePrize` REAL, `discount` REAL, `totalPrize` REAL, `verifyed` INTEGER)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `purchasedVegetables` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `purchaseId` INTEGER, `vegeID` INTEGER, `amount` REAL, `prize` REAL, `selected` INTEGER)');

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
  PurchaseDao get purchaseDao {
    return _purchaseDaoInstance ??= _$PurchaseDao(database, changeListener);
  }

  @override
  PurchasedVegetablesDao get purchasedVegetablesDao {
    return _purchasedVegetablesDaoInstance ??=
        _$PurchasedVegetablesDao(database, changeListener);
  }
}

class _$VegetableDao extends VegetableDao {
  _$VegetableDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _vegetableInsertionAdapter = InsertionAdapter(
            database,
            'Vegetables',
            (Vegetable item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'image': item.image,
                  'buyingPrizePerKg': item.buyingPrizePerKg,
                  'salePrizePerKg': item.salePrizePerKg
                }),
        _vegetableUpdateAdapter = UpdateAdapter(
            database,
            'Vegetables',
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
            'Vegetables',
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
  Future<List<Vegetable>> queryVegetable(String vegeName) async {
    return _queryAdapter.queryList('SELECT * FROM vegetable WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => Vegetable(
            id: row['id'] as int?,
            name: row['name'] as String,
            image: row['image'] as String,
            buyingPrizePerKg: row['buyingPrizePerKg'] as int,
            salePrizePerKg: row['salePrizePerKg'] as int),
        arguments: [vegeName]);
  }

  @override
  Future<List<Vegetable>> queryVegetableById(int id) async {
    return _queryAdapter.queryList('SELECT * FROM vegetable WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Vegetable(
            id: row['id'] as int?,
            name: row['name'] as String,
            image: row['image'] as String,
            buyingPrizePerKg: row['buyingPrizePerKg'] as int,
            salePrizePerKg: row['salePrizePerKg'] as int),
        arguments: [id]);
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
}

class _$PurchaseDao extends PurchaseDao {
  _$PurchaseDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _purchaseInsertionAdapter = InsertionAdapter(
            database,
            'purchases',
            (Purchase item) => <String, Object?>{
                  'id': item.id,
                  'serialNum': item.serialNum,
                  'releaseDate': item.releaseDate,
                  'sumOfVegetablePrize': item.sumOfVegetablePrize,
                  'discount': item.discount,
                  'totalPrize': item.totalPrize,
                  'verifyed':
                      item.verifyed == null ? null : (item.verifyed! ? 1 : 0)
                },
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Purchase> _purchaseInsertionAdapter;

  @override
  Stream<List<Purchase>> watchAllPurchasesWithPurchasedVegetables() {
    return _queryAdapter.queryListStream('SELECT * FROM purchases',
        mapper: (Map<String, Object?> row) => Purchase(
            id: row['id'] as int?,
            serialNum: row['serialNum'] as String?,
            releaseDate: row['releaseDate'] as String?,
            sumOfVegetablePrize: row['sumOfVegetablePrize'] as double?,
            discount: row['discount'] as double?,
            totalPrize: row['totalPrize'] as double?,
            verifyed:
                row['verifyed'] == null ? null : (row['verifyed'] as int) != 0),
        queryableName: 'purchases',
        isView: false);
  }

  @override
  Future<void> insertPurchasesWithPurchasedVegetables(Purchase invoice) async {
    await _purchaseInsertionAdapter.insert(invoice, OnConflictStrategy.replace);
  }
}

class _$PurchasedVegetablesDao extends PurchasedVegetablesDao {
  _$PurchasedVegetablesDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _purchasedVegetablesInsertionAdapter = InsertionAdapter(
            database,
            'purchasedVegetables',
            (PurchasedVegetables item) => <String, Object?>{
                  'id': item.id,
                  'purchaseId': item.purchaseId,
                  'vegeID': item.vegeID,
                  'amount': item.amount,
                  'prize': item.prize,
                  'selected':
                      item.selected == null ? null : (item.selected! ? 1 : 0)
                }),
        _purchasedVegetablesUpdateAdapter = UpdateAdapter(
            database,
            'purchasedVegetables',
            ['id'],
            (PurchasedVegetables item) => <String, Object?>{
                  'id': item.id,
                  'purchaseId': item.purchaseId,
                  'vegeID': item.vegeID,
                  'amount': item.amount,
                  'prize': item.prize,
                  'selected':
                      item.selected == null ? null : (item.selected! ? 1 : 0)
                }),
        _purchasedVegetablesDeletionAdapter = DeletionAdapter(
            database,
            'purchasedVegetables',
            ['id'],
            (PurchasedVegetables item) => <String, Object?>{
                  'id': item.id,
                  'purchaseId': item.purchaseId,
                  'vegeID': item.vegeID,
                  'amount': item.amount,
                  'prize': item.prize,
                  'selected':
                      item.selected == null ? null : (item.selected! ? 1 : 0)
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PurchasedVegetables>
      _purchasedVegetablesInsertionAdapter;

  final UpdateAdapter<PurchasedVegetables> _purchasedVegetablesUpdateAdapter;

  final DeletionAdapter<PurchasedVegetables>
      _purchasedVegetablesDeletionAdapter;

  @override
  Future<List<PurchasedVegetables>> getAllPurchasedVegetables() async {
    return _queryAdapter.queryList('SELECT * FROM purchasedVegetables',
        mapper: (Map<String, Object?> row) => PurchasedVegetables(
            id: row['id'] as int?,
            vegeID: row['vegeID'] as int?,
            purchaseId: row['purchaseId'] as int?,
            amount: row['amount'] as double?,
            prize: row['prize'] as double?,
            selected: row['selected'] == null
                ? null
                : (row['selected'] as int) != 0));
  }

  @override
  Future<List<PurchasedVegetables>> queryPurchasedVegetable(
      String vegeName) async {
    return _queryAdapter.queryList(
        'SELECT * FROM purchaseWithPurchasedVegetablesTable WHERE name LIKE ?1',
        mapper: (Map<String, Object?> row) => PurchasedVegetables(
            id: row['id'] as int?,
            vegeID: row['vegeID'] as int?,
            purchaseId: row['purchaseId'] as int?,
            amount: row['amount'] as double?,
            prize: row['prize'] as double?,
            selected:
                row['selected'] == null ? null : (row['selected'] as int) != 0),
        arguments: [vegeName]);
  }

  @override
  Future<List<PurchasedVegetables>> queryPurchaedVegetableById(
      int vegeId) async {
    return _queryAdapter.queryList(
        'SELECT * FROM purchaseWithPurchasedVegetablesTable WHERE id = ?1',
        mapper: (Map<String, Object?> row) => PurchasedVegetables(
            id: row['id'] as int?,
            vegeID: row['vegeID'] as int?,
            purchaseId: row['purchaseId'] as int?,
            amount: row['amount'] as double?,
            prize: row['prize'] as double?,
            selected:
                row['selected'] == null ? null : (row['selected'] as int) != 0),
        arguments: [vegeId]);
  }

  @override
  Future<void> addPurchasedVegetable(
      PurchasedVegetables purchasedVegetables) async {
    await _purchasedVegetablesInsertionAdapter.insert(
        purchasedVegetables, OnConflictStrategy.replace);
  }

  @override
  Future<void> updatePurchasedVegetable(
      PurchasedVegetables purchasedVegetables) async {
    await _purchasedVegetablesUpdateAdapter.update(
        purchasedVegetables, OnConflictStrategy.abort);
  }

  @override
  Future<void> deletePurchasedVegetable(
      PurchasedVegetables purchasedVegetables) async {
    await _purchasedVegetablesDeletionAdapter.delete(purchasedVegetables);
  }
}

// ignore_for_file: unused_element
final _vegetableTypeConverter = VegetableTypeConverter();
