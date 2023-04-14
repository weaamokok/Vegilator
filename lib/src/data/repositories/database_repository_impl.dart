import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/domain/repositories/database_repository.dart';

import '../datasources/local/app_database.dart';

class DatabseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;
  DatabseRepositoryImpl(this._appDatabase);

  @override
  Future<void> addVegetable(Vegetable vege) {
    return _appDatabase.vegetableDao.insertVegetable(vege);
  }

  @override
  Future<List<Vegetable>> getAddedVegetables() {
    return _appDatabase.vegetableDao.getAllVegetables();
  }

  @override
  Future<void> removeVegetable(Vegetable vege) {
    return _appDatabase.vegetableDao.deleteVegetable(vege);
  }

  @override
  Future<void> updateVegetable(Vegetable vege) {
    // TODO: implement updateVegetable
    throw UnimplementedError();
  }
}
