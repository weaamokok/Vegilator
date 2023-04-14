import 'package:floor/floor.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegilator/src/domain/models/purchase_with_purchased_vegetables.dart';

abstract class PurchaseDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPurchasesWithPurchasedVegetables(
      PurchaseWithPurchasedVegetables purchaseWithPurchasedVegetables);
  @Query('SELECT * FROM purchases')
  Stream<List<PurchaseWithPurchasedVegetables>>
      watchAllPurchasesWithPurchasedVegetables();
}
