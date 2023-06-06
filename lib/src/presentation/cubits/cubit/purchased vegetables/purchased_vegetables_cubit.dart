import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:vegilator/src/domain/models/expoerts.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';

part 'purchased_vegetables_state.dart';

class PurchasedVegetablesCubit extends Cubit<PurchasedVegetablesState> {
  PurchasedVegetablesCubit() : super(const PurchasedVegetablesLoaded());


void updatePurchasedVeges(PurchasedVegetables purchased){


    

   emit(PurchasedVegetablesSelected(purchasedVegetables: purchased.copyWith(selected:!purchased.selected!)));

//           state.purchased.map((purchasedVeges) {
// purchasedVeges.amount == event.purchasedVegetables.amount) &&
//                 (purchasedVeges.prize == event.purchasedVegetables.prize) &&
//                 (purchasedVeges.purchaseId ==
//                     event.purchasedVegetables.purchaseId) &&
//                 (purchasedVeges.selected == event.purchasedVegetables.selected)
//             ? event.purchasedVegetables
//             : purchasedVeges;
//       }).toList();
//       yield PurchaseLoaded(purchase: ToPurchase(purchasedVegetables: updatedPurchasedVeges));
}

}
