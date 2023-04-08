import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class CircularIconButton extends StatelessWidget {
  const CircularIconButton({required this.icon, required this.onTap});
  final IconData icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap(),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: PrimaryGreen,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
