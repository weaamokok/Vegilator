import 'package:flutter/material.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/presentation/widgets/app_bar.dart';

import '../widgets/add_card.dart';
import '../widgets/inventory_vegetable_card.dart';
import '../widgets/searchbar.dart';

class Inventory extends StatelessWidget {
  const Inventory({Key? key}) : super(key: key);

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
                    id: 1,
                    image: AssetImage('images/tomato 1.png'),
                    salePrizePerKg: 10),
              ),
              InventoryVegetableCard(
                vege: Vegetable(
                    name: 'طماطم',
                    buyingPrizePerKg: 10,
                    id: 1,
                    image: AssetImage('images/tomato 1.png'),
                    salePrizePerKg: 10),
              ),
              InventoryVegetableCard(
                vege: Vegetable(
                    name: 'طماطم',
                    buyingPrizePerKg: 10,
                    id: 1,
                    image: AssetImage('images/tomato 1.png'),
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
