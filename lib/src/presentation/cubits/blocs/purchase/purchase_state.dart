part of 'purchase_bloc.dart';

abstract class PurchaseState extends Equatable {
  const PurchaseState();
  @override
  List<Object> get props => [];
}

class PurchaseLoading extends PurchaseState {
}
class PurchaseLoaded extends PurchaseState {

  final ToPurchase purchase;
  const PurchaseLoaded({this.purchase=const ToPurchase()});
    @override
  List<Object> get props => [purchase];
}
