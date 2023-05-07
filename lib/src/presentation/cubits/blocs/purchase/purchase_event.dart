part of 'purchase_bloc.dart';

abstract class PurchaseEvent extends Equatable {
  const PurchaseEvent();

  @override
  List<Object> get props => [];
}

class PurchaseLoad extends PurchaseEvent {
  PurchaseLoad();
  @override
  List<Object> get props => [];
}

class PurchaseVegetablesUpdated extends PurchaseEvent {
  final PurchasedVegetables purchasedVegetables;
  const PurchaseVegetablesUpdated({required this.purchasedVegetables});
  @override
  List<Object> get props => [purchasedVegetables];
}
