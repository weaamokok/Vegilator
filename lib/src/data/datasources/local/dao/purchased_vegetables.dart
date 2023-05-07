import 'package:floor/floor.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';

import '../../../../utils/constants/strings.dart';

@dao
abstract class PurchasedVegetablesDao {
  @Query('SELECT * FROM $purchasedVegetables')
  Future<List<PurchasedVegetables>> getAllPurchasedVegetables();
  @Query('SELECT * FROM $purchaseWithPurchasedVegetables WHERE name LIKE :vegeName')
  Future<List<PurchasedVegetables>> queryPurchasedVegetable(String vegeName);
   @Query('SELECT * FROM $purchaseWithPurchasedVegetables WHERE id = :vegeId')
  Future<List<PurchasedVegetables>> queryPurchaedVegetableById(int vegeId);
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addPurchasedVegetable(PurchasedVegetables purchasedVegetables);

  @update
  Future<void> updatePurchasedVegetable(
      PurchasedVegetables purchasedVegetables);

  @delete
  Future<void> deletePurchasedVegetable(
      PurchasedVegetables purchasedVegetables);
}
