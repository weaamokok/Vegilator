import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class VegetableToSelect extends StatelessWidget {
  const VegetableToSelect({Key? key}) : super(key: key);
//todo add constructors
  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.rtl,
        children: [
          Checkbox(
              value: false,
              onChanged: (h) {},
              activeColor: PrimaryGreen,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          Image(image: AssetImage('images/tomato 1.png')),
          Text(
            'طماطم',
            style: TextStyle(fontSize: 12),
          ),
          Text(
            '1 ' + 'د/الكيلو ',
            style: TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
