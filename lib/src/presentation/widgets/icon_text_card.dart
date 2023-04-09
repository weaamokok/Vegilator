import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class IconTextCard extends StatelessWidget {
  const IconTextCard(
      {required this.onTap, required this.icon, required this.text});
  final Function onTap;
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: Container(
        height: 116,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: PrimaryGreen)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: PrimaryGreen,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 13),
            )
          ],
        ),
      ),
    );
  }
}
