part of 'purchased_vegetables_bloc.dart';

abstract class PurchasedVegetablesEvent extends Equatable {
  const PurchasedVegetablesEvent();

  @override
  List<Object> get props => [];
}
class PurchasedVegatbleLoad extends PurchasedVegetablesEvent{
  @override
  List<Object> get props => [];
}


class PurchasedVegatbleUpdated extends PurchasedVegetablesEvent{
  final PurchasedVegetables purchasedVegetables;

  PurchasedVegatbleUpdated({required this.purchasedVegetables}); 
  @override
  List<Object> get props => [purchasedVegetables];
}