import 'package:flutter/material.dart';

import '../widgets/app_bar.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomAppBar(title: 'تقارير عمليات الشراء'), Container()],
    );
  }
}
