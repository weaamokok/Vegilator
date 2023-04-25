import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/vegetable.dart';
import '../../../domain/repositories/database_repository.dart';

part 'vegetabes_state.dart';

//First thing here we see is that this cubit depends on the DatabaseRepository dependency that will be later on injected into this class
class VegetabesCubit extends Cubit<VegetabesState> {
  final DatabaseRepository _databaseRepository;
  VegetabesCubit(this._databaseRepository) : super(const VegetablesLoading());
  //We’ve also defined multiple methods that will be called directly from the UI in which they contains the implementation of our database and the repository.
  Future<void> getAllSavedVegetables() async {
    emit(await _getAllSavedVegetables());
  }

  //that deletes vegetable
  Future<void> removeVegetable({required Vegetable vegetable}) async {
    await _databaseRepository.removeVegetable(vegetable);
    emit(await _getAllSavedVegetables());
  }

  Future<void> addVegetable({required Vegetable vege}) async {
    await _databaseRepository.addVegetable(vege).whenComplete(() => debugPrint('added sucessfully'));

    emit(await _getAllSavedVegetables());
  }

  Future<void> updateVegetable({required Vegetable vege}) async {
    await _databaseRepository.updateVegetable(vege);
    emit(await _getAllSavedVegetables());
  }

//that connects with database, returns a success state
  Future<VegetabesState> _getAllSavedVegetables() async {
    final vegetables = await _databaseRepository.getAddedVegetables();
    return VegetablesSuccess(vegetables: vegetables);
  }
}
