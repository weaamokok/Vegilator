import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';

part 'purchased_vegetables_event.dart';
part 'purchased_vegetables_state.dart';

class PurchasedVegetablesBloc
    extends Bloc<PurchasedVegetablesEvent, PurchasedVegetablesState> {
  PurchasedVegetablesBloc() : super(PurchasedVegetablesLoading());
  @override
  Stream<PurchasedVegetablesState> mapEventToState(
      PurchasedVegetablesEvent event) async* {
    if (event is PurchasedVegatbleLoad) {
      yield* _mapPurchasedVegetableLoadToState();
    }
    if (event is PurchasedVegatbleUpdated) {
      yield* _mapPurchasedVegetableUpdateToState(event, state);
    }
  }

  Stream<PurchasedVegetablesState> _mapPurchasedVegetableLoadToState() async* {
    // yield PurchasedVegatbleLoad()
  }
  Stream<PurchasedVegetablesState> _mapPurchasedVegetableUpdateToState(
      PurchasedVegatbleUpdated event, PurchasedVegetablesState state) async* {

        if(state is PurchasedVegetablesLoaded){
         // final List<PurchasedVegetables> updatedPurchasedVegetable=state.purchasedVegetables.;
        }
      }
}
