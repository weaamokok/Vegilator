import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';
import 'package:vegilator/src/presentation/cubits/blocs/purchase/purchase_bloc.dart';
import 'package:vegilator/src/presentation/cubits/cubit/purchased%20vegetables/purchased_vegetables_cubit.dart';
import 'package:vegilator/src/utils/constants/strings.dart';

import '../../utils/constants/colors.dart';
import '../cubits/cubit/vegetabes_cubit.dart';
import '../provider/purchaseProviding.dart';

class PurchasedVegetableCard extends StatelessWidget {
  final PurchasedVegetables purchasedVegetable;
  const PurchasedVegetableCard({required this.purchasedVegetable});

  @override
  Widget build(BuildContext context) {
    final purchaseBloc =
        BlocProvider.of<PurchaseBloc>(context);
    final vegetabesCubit = BlocProvider.of<VegetabesCubit>(context);
    final pvegetabesCubit = BlocProvider.of<PurchasedVegetablesCubit>(context);
    return FutureBuilder(
        future: vegetabesCubit.getVegetablesById(id: purchasedVegetable.vegeID),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final veges = snapshot.data!.vegetables.first;
            return Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .005,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .020,
                    horizontal: MediaQuery.of(context).size.height * .020,
                  ),
                  decoration: BoxDecoration(
                      //color: ,changes when state of checkness changess
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: PrimaryGreen)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    textDirection: TextDirection.rtl,
                    children: [
                      Checkbox(
                          value:purchasedVegetable.selected ,
                          onChanged: (bool? h) {

print( Provider.of<PurchaseProvider>(context,listen: false).purchasedVeges);
 Provider.of<PurchaseProvider>(context,listen: false).updateSelectionOfPurchasedVege(purchasedVegetable.copyWith(selected: !purchasedVegetable.selected!));
                        //    pvegetabesCubit.updatePurchasedVeges(purchasedVegetable);
                          //  print('$h' + ' debug');
                            // purchasedVegetabesCubit.updatePurchasedVeges(purchasedVegetable);
// purchaseBloc.(  purchasedVegetable.copyWith(
//                                             selected: purchasedVegetable
//                                                 .selected==true?false:true));
// purchaseBloc.add(   PurchaseVegetablesUpdated(
//                                     purchasedVegetables:
//                                         purchasedVegetable.copyWith(
//                                             selected: !purchasedVegetable
//                                                 .selected!)));
// purchaseBloc.mapEventToState( PurchaseVegetablesUpdated(
//                                purchasedVegetables:
//                                          purchasedVegetable.copyWith(
//                                              selected: !purchasedVegetable
//                                                  .selected!)));

//                             context.read<PurchaseBloc>().add(
//                                 PurchaseVegetablesUpdated(
//                                     purchasedVegetables:
//                                         purchasedVegetable.copyWith(
//                                             selected: !purchasedVegetable
//                                                 .selected!)));
                          },
                          activeColor: PrimaryGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      Image(
                          image:
                              MemoryImage(base64Decode(veges.image), scale: 1),
                          width: 50),
                      Text(
                        veges.name.toString(),
                        style: TextStyle(fontSize: 12),
                      ),
                      Text(
                        '${veges.salePrizePerKg} ' ' د/الكيلو ',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
          }else return Text('no data');}
        );
  }
}
