//DAO stands for “Data Access Object” and it is a design pattern used in software development to provide an abstract interface for accessing a database or other data source. In the context of Flutter Floor, DAOs are interfaces that define methods for interacting with SQLite databases.
import 'package:floor/floor.dart';

import '../../../../domain/models/vegetable.dart';
import '../../../../utils/constants/strings.dart';

@dao
abstract class VegetableDao {
  @Query('SELECT * FROM $vegetablesTable')
  Future<List<Vegetable>> getAllVegetables();
  @Query('SELECT * FROM $vegetablesTable WHERE name LIKE : %vegeName%')
  Future<List<Vegetable>> queryVegetable(String vegeName);
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertVegetable(Vegetable vege);
  @update
  Future<void> updateVegetable(Vegetable vege);
  @delete
  Future<void> deleteVegetable(Vegetable vege);
}
