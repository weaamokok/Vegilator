import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vegilator/main.dart';

import '../../../utils/constants/colors.dart';
import '../../cubits/cubit/vegetabes_cubit.dart';
String searchKeyword='';

@RoutePage()
class InventorySearch extends StatefulWidget {
  const InventorySearch({super.key});

  @override
  State<InventorySearch> createState() => _InventorySearchState();
}

class _InventorySearchState extends State<InventorySearch> {
  @override
  Widget build(BuildContext context) {
            final vegetabesCubit = BlocProvider.of<VegetabesCubit>(context);
    return Scaffold(body: Container(padding: const EdgeInsets.symmetric(horizontal: 20),child: Align(alignment: Alignment.topCenter,child: Column(
     children: [const SizedBox(height: 50,),
      Row(
        children: [Expanded(child: IconButton(padding: const EdgeInsets.only(right: 20),onPressed: (){appRouter.pop();} , icon: Icon(Icons.arrow_back,color: Black.withOpacity(.8),))),
          Expanded(flex: 10,
            child: TextFormField( onChanged:(value) {
              setState(() {
                searchKeyword=value;
              });
            },
            textDirection: TextDirection.rtl,
            cursorColor: Orange.withOpacity(.5),
            decoration: InputDecoration(
                hintText: 'ابحث بإسم الخضرة ...',
                hintTextDirection: TextDirection.rtl,
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                prefixIcon: Icon(Icons.search, color: Grey, size: 30),
                focusColor: Orange.withOpacity(.5),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Orange.withOpacity(.5))),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Grey, width: 1)),
                disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Grey, width: 1)), //orang from constants
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
              ),
          ),
        ],
      ),
      Divider(color: Black.withOpacity(.2)),
       FutureBuilder(future:vegetabesCubit.getVegetablesByName(name: '%$searchKeyword%') ,builder: (context, snapshot) {
        
         var data=snapshot.data;
         if(data!=null)
        { return Expanded(
           child: ListView.builder(padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),itemCount: data.vegetables.length,itemBuilder: (context, index) {
final vege=data.vegetables[index];
             return Container(height: MediaQuery.of(context).size.height*.1,decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Black.withOpacity(.1)))),child: Row(textDirection: TextDirection.rtl,crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [Image.memory(base64Decode(vege.image),width: 50,),
                 Text(vege.name.toString()),Text('${vege.salePrizePerKg}   للكيلو   ',textDirection: TextDirection.rtl,)
               ],
             ),);
           },),
         );}
         else {return const Center(child: CircularProgressIndicator(),);}

      
       },)
     ],
   ),)),);
  }
}


