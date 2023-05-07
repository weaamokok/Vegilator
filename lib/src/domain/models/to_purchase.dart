import 'package:equatable/equatable.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';

class ToPurchase extends Equatable{
  final List<PurchasedVegetables> purchasedVegetables;
  const ToPurchase({this.purchasedVegetables=const <PurchasedVegetables>[]});

ToPurchase copyWith({
  List<PurchasedVegetables>? purchasedVegetables
}){
  return ToPurchase(purchasedVegetables: purchasedVegetables??this.purchasedVegetables);
}

  @override
  List<Object?> get props => [purchasedVegetables];
}