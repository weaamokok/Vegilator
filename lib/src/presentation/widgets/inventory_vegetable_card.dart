import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/presentation/cubits/cubit/vegetabes_cubit.dart';
import 'package:vegilator/src/utils/constants/colors.dart';

import 'circul_Icon_button.dart';

class InventoryVegetableCard extends StatelessWidget {
  const InventoryVegetableCard({required this.vege});
  final Vegetable vege;
  @override
  Widget build(BuildContext context) {
        final vegetabesCubit=BlocProvider.of<VegetabesCubit>(context);

    return Container(
      width:  MediaQuery.of(context).devicePixelRatio*0.2,
      padding: EdgeInsets.only(top: 5),
      child: Column(children: [
        Expanded(flex: 3,child: Image.memory(base64Decode(vege.image,),fit:BoxFit.fill,width: 80,height: 100, )),
        Expanded(child: Text(vege.name, style: TextStyle(fontSize: 14))),
        Expanded(
          child: Text(
            vege.salePrizePerKg.toString() + 'د/ كيلو',
            style: TextStyle(fontSize: 12),
            textDirection: TextDirection.rtl,
          ),
        ),
        Expanded(flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularIconButton(icon: Icons.edit, onTap: () {}),
              InkWell(
              onTap:(){
          vegetabesCubit.removeVegetable(vegetable: vege);
              },
              child: CircleAvatar(
          radius: 20,
          backgroundColor: PrimaryGreen,
          child: Icon(Icons.delete, color: Colors.white),
              ),
            )
              // CircularIconButton(icon: Icons.delete, onTap: () {
              //   //vegetabesCubit.removeVegetable(vegetable: vege);
              //   })
            ],
          ),
        ),SizedBox(height: 10,)
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PrimaryGreen),
      ),
    );
  }
}
