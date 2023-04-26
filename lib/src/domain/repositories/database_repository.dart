import 'package:vegilator/src/domain/models/vegetable.dart';

//This abstracted repository holds the abstractions of our database functionality and should be implemented in the Data Layer like we did with the ApiRepository.
abstract class DatabaseRepository {
  Future<List<Vegetable>> getAddedVegetables();
  Future<void> addVegetable(Vegetable vege);
  Future<void> updateVegetable(Vegetable vege);
  Future<void> removeVegetable(Vegetable vege);
  Future<void> queryVegetable(String vegeName);
}
