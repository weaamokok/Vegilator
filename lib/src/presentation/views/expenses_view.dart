import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class Expenses extends StatelessWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomAppBar(title: 'المصروفات'), Container()],
    );
  }
}
