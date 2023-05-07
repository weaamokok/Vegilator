// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'purchased_vegetables_cubit.dart';

abstract class PurchasedVegetablesState extends Equatable {
const PurchasedVegetablesState();

  @override
  List<Object> get props => [];
}


class PurchasedVegetablesLoading extends PurchasedVegetablesState{
  const PurchasedVegetablesLoading();
  
}
class PurchasedVegetablesLoaded extends PurchasedVegetablesState {
  final ToPurchase purchasedVegetables;
  const PurchasedVegetablesLoaded({this.purchasedVegetables=const ToPurchase()});

    @override
  List<Object> get props => [purchasedVegetables];

}class PurchasedVegetablesSelected extends PurchasedVegetablesState {
  final PurchasedVegetables purchasedVegetables;
  const PurchasedVegetablesSelected({this.purchasedVegetables=const PurchasedVegetables()});

    @override
  List<Object> get props => [purchasedVegetables];

}
class PurchasedVegetablesError extends PurchasedVegetablesState {
  final String message;
  const PurchasedVegetablesError(this.message);
  

  @override
  bool operator ==(covariant PurchasedVegetablesError other) {
    if (identical(this, other)) return true;
  
    return 
      other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
