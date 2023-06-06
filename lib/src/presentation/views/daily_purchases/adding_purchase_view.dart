import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vegilator/main.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';
import 'package:vegilator/src/domain/models/to_purchase.dart';
import 'package:vegilator/src/presentation/cubits/cubit/purchased%20vegetables/purchased_vegetables_cubit.dart';
import 'package:vegilator/src/presentation/provider/purchaseProviding.dart';

import '../../../domain/models/vegetable.dart';
import '../../../utils/constants/colors.dart';
import '../../cubits/cubit/vegetabes_cubit.dart';
import '../../widgets/purchasedVegetablesCard.dart';
import '../../widgets/searchbar.dart' as searchbar;

//I tried to fetch the data from inventory and dispaly it here
//then user select items and these items are moved to somthing like cart and displayed as cards where user can adjest
//the amount and price they want
List selecteItems = [];

class AddingPurchaseView extends StatefulWidget {
  const AddingPurchaseView({Key? key}) : super(key: key);

  @override
  State<AddingPurchaseView> createState() => _AddingPurchaseViewState();
}

class _AddingPurchaseViewState extends State<AddingPurchaseView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vegetabesCubit = BlocProvider.of<VegetabesCubit>(context);
    final purchasedVegetabesCubit =
        BlocProvider.of<PurchasedVegetablesCubit>(context);

    return Scaffold(
      appBar: _PurchaseAppbar(context),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .050,
            vertical: MediaQuery.of(context).size.width * .050),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              searchbar.SearchBar(
                readOnly: true,
              ),
            
              SizedBox(height: MediaQuery.of(context).size.width * .030),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'تم شراءها مؤخراً',
                ),
              ),
              FutureBuilder(
                future: vegetabesCubit.getAllSavedVegetables(),
                builder: (context, snapshot) {
                  if (snapshot.data!=null) {
                    final veges = snapshot.data!.vegetables;//from db
             //  print(veges);
                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: veges.length,
                        itemBuilder: (context, index) {
                          // purchasedVeges.add(
                          //     PurchasedVegetables(vegeID: veges[index].id));
                          return PurchasedVegetableCard(
                              purchasedVegetable:
                                  Provider.of<PurchaseProvider>(context)
                                      .purchasedVeges[index]);
                        });
                  } else {
                    return Center(
                      child: Text('no data'),
                    );
                  }
                },
              )
              // BlocBuilder<VegetabesCubit, VegetabesState>(builder: (_, state) {
              //   switch (state.runtimeType) {
              //     case VegetablesLoading:
              //       return const Center(
              //         child: CupertinoActivityIndicator(),
              //       );
              //     case VegetablesSuccess:
              //       return _buildPurchasableVegetables(
              //           state.vegetables, context);
              //     default:
              //       return const SizedBox();
              //   }
              // })
            ]),
      ),
    );
  }
}

PreferredSize _PurchaseAppbar(context) {
  return PreferredSize(
    preferredSize: Size(double.infinity, 70),
    child: AppBar(
      centerTitle: true,
      elevation: 5,
      shadowColor: Colors.black54,
      title: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: const Text(
            'إضافة عملية شراء',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )),
      leading: IconButton(
          padding: EdgeInsets.symmetric(vertical: 20),
          onPressed: () {
            appRouter.pop();
            Provider.of<PurchaseProvider>(context, listen: false)
                .purchasedVeges
                .clear();
          },
          icon: Icon(MdiIcons.close)),
      actions: const [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 23.0, horizontal: 16),
          child: Icon(
            Icons.arrow_forward,
          ),
        )
      ],
    ),
  );
}

Widget _buildPurchasableVegetables(List<Vegetable> veges, context) {
  final purchasedVegetabesCubit =
      BlocProvider.of<PurchasedVegetablesCubit>(context);

  return ListView.builder(
    shrinkWrap: true,
    itemCount: veges.length,
    itemBuilder: (context, index) => Container(
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
              value: false,
              onChanged: (h) {
                // purchasedVegetabesCubit.updatePurchasedVeges(
                //     purchasedVegetabesCubit.state.purchasedVegetables.copyWith(
                //         selected: !purchasedVegetabesCubit
                //             .state.purchasedVegetables.selected!));
                // context.read<PurchaseBloc>().add(
                //     PurchaseVegetablesUpdated(
                //         purchasedVegetables:
                //            purchasedVegetabesCubit. state.purchasedVegetables
                //             .copyWith(
                //                 selected: !purchasedVegetabesCubit.state

                //                     .purchasedVegetables!
                //                     .selected!)));
              },
              activeColor: PrimaryGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          Image(
              image: MemoryImage(base64Decode(veges[index].image), scale: 1),
              width: 50),
          Text(
            veges[index].name.toString(),
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '${veges[index].salePrizePerKg} ' ' د/الكيلو ',
            textDirection: TextDirection.rtl,
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    ),
  );
}
