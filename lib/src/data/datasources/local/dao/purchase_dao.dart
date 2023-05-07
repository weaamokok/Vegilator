import 'package:floor/floor.dart';
import 'package:vegilator/src/domain/models/purchase_with_purchased_vegetables.dart';

import '../../../../domain/models/purchase.dart';

@dao
abstract class PurchaseDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertPurchasesWithPurchasedVegetables(
      Purchase invoice);
  @Query('SELECT * FROM purchases')
  Stream<List<Purchase>>
      watchAllPurchasesWithPurchasedVegetables();
}
