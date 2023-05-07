import 'package:vegilator/src/domain/models/purchase.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';

//This abstracted repository holds the abstractions of our database functionality and should be implemented in the Data Layer like we did with the ApiRepository.
abstract class DatabaseRepository {
  //inventory managment
  Future<List<Vegetable>> getAddedVegetables();
  Future<void> addVegetable(Vegetable vege);
  Future<void> updateVegetable(Vegetable vege);
  Future<void> removeVegetable(Vegetable vege);
  Future<List<Vegetable>> queryVegetable(String vegeName);
 Future <List <Vegetable>> queryVegetableById(int id);
  //purchase managemnet
  Future<List<PurchasedVegetables>> getPurchasesVegetables();
  Future<void> addPurchasedVegetable(PurchasedVegetables purchase);
  Future<void> updatePurchasedVegetable(PurchasedVegetables purchase);
  Future<void> removePurchasedVegetable(PurchasedVegetables purchase);
  Future<List<PurchasedVegetables>> queryPurchasedVegetable(String vegeName);
}
