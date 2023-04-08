import 'package:flutter/material.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/utils/constants/colors.dart';

import 'circul_Icon_button.dart';

class InventoryVegetableCard extends StatelessWidget {
  const InventoryVegetableCard({required this.vege});
  final Vegetable vege;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 156,
      padding: EdgeInsets.symmetric(vertical: 0),
      child: Column(children: [
        Image(image: vege.image),
        Text(vege.name, style: TextStyle(fontSize: 14)),
        Text(
          vege.salePrizePerKg.toString() + 'د/ كيلو',
          style: TextStyle(fontSize: 12),
          textDirection: TextDirection.rtl,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircularIconButton(icon: Icons.edit, onTap: () {}),
            CircularIconButton(icon: Icons.delete, onTap: () {})
          ],
        ),
      ]),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PrimaryGreen),
      ),
    );
  }
}
