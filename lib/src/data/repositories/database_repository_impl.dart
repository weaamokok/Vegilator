import 'package:vegilator/src/domain/models/purchase.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/domain/repositories/database_repository.dart';
import 'package:vegilator/src/utils/constants/strings.dart';

import '../datasources/local/app_database.dart';

class DatabseRepositoryImpl implements DatabaseRepository {
  final AppDatabase _appDatabase;
  DatabseRepositoryImpl(this._appDatabase);
//manage inventory
  @override
  Future<void> addVegetable(Vegetable vege) {
    return _appDatabase.vegetableDao.insertVegetable(vege);
  }

  @override
  Future<List<Vegetable>> getAddedVegetables() {
    return _appDatabase.vegetableDao.getAllVegetables();
  }  @override
  Future<List<Vegetable>> queryVegetable(String vegeName) {
    return _appDatabase.vegetableDao.queryVegetable(vegeName);
  }

  @override
  Future<void> removeVegetable(Vegetable vege) {
    return _appDatabase.vegetableDao.deleteVegetable(vege);
  }

  @override
  Future<void> updateVegetable(Vegetable vege) {
return _appDatabase.vegetableDao.updateVegetable(vege);
  }


  
//manage purchased vegetables
  @override
  Future<void> addPurchasedVegetable(PurchasedVegetables purchasedVegetables) {
      return _appDatabase.purchasedVegetablesDao.addPurchasedVegetable(purchasedVegetables);

  }

  @override
  Future<List<PurchasedVegetables>> getPurchasesVegetables() {
    return _appDatabase.purchasedVegetablesDao.getAllPurchasedVegetables();
  }

  @override
  Future<List<PurchasedVegetables>> queryPurchasedVegetable(String vegeName) {
     return _appDatabase.purchasedVegetablesDao.queryPurchasedVegetable(vegeName);

  }

  @override
  Future<void> removePurchasedVegetable(PurchasedVegetables purchasedVegetables) {
    return _appDatabase.purchasedVegetablesDao.deletePurchasedVegetable(purchasedVegetables);

  }

  @override
  Future<void> updatePurchasedVegetable(PurchasedVegetables purchasedVegetables) {
  return _appDatabase.purchasedVegetablesDao.updatePurchasedVegetable(purchasedVegetables);

  }
  
  @override
  Future<List<Vegetable>> queryVegetableById(int id) {
      return _appDatabase.vegetableDao.queryVegetableById(id);

  }
}
