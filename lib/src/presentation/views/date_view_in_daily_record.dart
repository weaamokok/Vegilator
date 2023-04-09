import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class DateViewInDailyRecord extends StatelessWidget {
  const DateViewInDailyRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .050),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Grey,
                    )),
                InkWell(
                  onTap: () {
                    //here we display calender
                  },
                  child: Text('اليوم',
                      style: TextStyle(
                        color: Black.withOpacity(.6),
                      )),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Grey,
                    )),
              ],
            ),
            Divider(
              color: Black.withOpacity(.2),
              height: 10,
            )
          ],
        ));
  }
}
