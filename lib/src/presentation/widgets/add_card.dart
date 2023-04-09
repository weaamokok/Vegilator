import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class addCard extends StatelessWidget {
  const addCard({required this.onAdd,});
  final Function onAdd;


  @override
  Widget build(BuildContext context) {
    return Container(
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
      decoration: BoxDecoration(
        color: PrimaryGreen,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: PrimaryGreen),
      ),
    );
  }
}
