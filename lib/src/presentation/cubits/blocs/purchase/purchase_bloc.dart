import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:vegilator/src/domain/models/purchasedVegetables.dart';

import '../../../../domain/models/to_purchase.dart';

part 'purchase_event.dart';
part 'purchase_state.dart';

class PurchaseBloc extends Bloc<PurchaseEvent, PurchaseState> {
  PurchaseBloc() : super(PurchaseLoading()) {
    on<PurchaseEvent>((event, emit) {

    });
    on<PurchaseLoad>((event, emit) {
      
    },);
    on<PurchaseVegetablesUpdated>((event, emit) {
      
    },);
  }

  Stream<PurchaseState> mapEventToState(PurchaseEvent event) async* {
    if (event is PurchaseLoad) {
        yield PurchaseLoading();

      yield* _mapPurchaseLoadToState();
    }
    if (event is PurchaseVegetablesUpdated) {

      yield* _mapPurchaseVegetablesUpdateToState(event, state);
    }
  }

  Stream<PurchaseState> _mapPurchaseLoadToState() async* {
      yield PurchaseLoading();
    yield PurchaseLoaded(
        purchase: ToPurchase(purchasedVegetables: PurchasedVegetables.purchased));
  }
///// pt's not updating!!!!!!!!!!!!!!!!!!!!!!!!!!!
  Stream<PurchaseState> _mapPurchaseVegetablesUpdateToState(

      PurchaseVegetablesUpdated event, PurchaseState state) async* {
    if (state is PurchaseLoaded) {
      print(event.purchasedVegetables.selected);
      final List<PurchasedVegetables> updatedPurchasedVeges =
          state.purchase.purchasedVegetables.map((purchasedVeges) {
        return (purchasedVeges.vegeID == event.purchasedVegetables.vegeID) 
            ? event.purchasedVegetables
            : purchasedVeges;
      }).toList();
      yield PurchaseLoaded(purchase: ToPurchase(purchasedVegetables: updatedPurchasedVeges));
    }else print('missed up');
  }
}
