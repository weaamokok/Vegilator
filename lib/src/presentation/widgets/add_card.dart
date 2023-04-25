import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../views/inventory/inventory_view.dart';

class addCard extends StatelessWidget {
  const addCard();



  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.all(40),margin: EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(onTap: (){ openAddVegetbleForm(context);},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Icon(
                Icons.add,
                color: PrimaryGreen,
                size: 50,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'أضف بضاعة ',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      decoration: BoxDecoration(
        color: PrimaryGreen,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PrimaryGreen),
      ),
    );
  }
}
