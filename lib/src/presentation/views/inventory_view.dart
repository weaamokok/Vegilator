import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegilator/main.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/presentation/widgets/app_bar.dart';
import 'package:path_provider/path_provider.dart';
import '../widgets/add_card.dart';
import '../widgets/inventory_vegetable_card.dart';
import '../widgets/searchbar.dart';

String? im;

Future<String> convertToString() async {
  final ByteData bytes = await rootBundle.load('images/tomato 1.png');

  final Uint8List list = bytes.buffer.asUint8List();
  im = base64Encode(list);
  return base64Encode(list);
}

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    convertToString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'بضاعة المحل', topIcon: Icons.add),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .050,
              vertical: MediaQuery.of(context).size.width * .050),
          child: SearchBar(event: () {}),
        ),
        Expanded(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .060,
                vertical: MediaQuery.of(context).size.width * .010),
            mainAxisSpacing: 10,
            crossAxisSpacing: 20,
            children: [
              InventoryVegetableCard(
                vege: Vegetable(
                    name: 'طماطم',
                    buyingPrizePerKg: 10,
                    id: '1',
                    image: im!,
                    salePrizePerKg: 10),
              ),
              InventoryVegetableCard(
                vege: Vegetable(
                    name: 'طماطم',
                    buyingPrizePerKg: 10,
                    id: ' 1',
                    image: im!,
                    salePrizePerKg: 10),
              ),
              InventoryVegetableCard(
                vege: Vegetable(
                    name: 'طماطم',
                    buyingPrizePerKg: 10,
                    id: '1',
                    image: im!,
                    salePrizePerKg: 10),
              ),
              addCard(
                onAdd: () {},
              )
            ],
          ),
        )
      ],
    );
  }
}
