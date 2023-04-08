import 'package:flutter/material.dart';
import 'package:vegilator/src/utils/constants/colors.dart';

import '../widgets/app_bar.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomAppBar(title: 'الملف الشخصي'), Container()],
    );
  }
}
