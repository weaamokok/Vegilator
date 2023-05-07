part of 'purchased_vegetables_bloc.dart';

abstract class PurchasedVegetablesState extends Equatable {
  const PurchasedVegetablesState();
  
  @override
  List<Object> get props => [];
}

class PurchasedVegetablesLoading extends PurchasedVegetablesState {}
class PurchasedVegetablesLoaded extends PurchasedVegetablesState {
  final PurchasedVegetables purchasedVegetables;
  PurchasedVegetablesLoaded({this.purchasedVegetables=const PurchasedVegetables()});
}
