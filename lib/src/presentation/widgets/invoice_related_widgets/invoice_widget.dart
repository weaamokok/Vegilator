import 'package:flutter/material.dart';
import 'package:vegilator/src/domain/models/invoice.dart';
import 'package:vegilator/src/presentation/views/invoice_View.dart';

import '../../../utils/constants/colors.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({required this.invoice});
  final Invoice invoice;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * .020,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: PrimaryGreen)),
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: PrimaryGreen,
            elevation: 0,
            isScrollControlled: true,
            builder: (context) => InvoiceView(invoice),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      'الفاتورة رقم ',
                      style:
                          TextStyle(color: Black.withOpacity(.7), fontSize: 14),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      invoice.serialNum.toString(),
                      style: TextStyle(color: Black, fontSize: 15),
                    ),
                  ],
                ),
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    Text(
                      invoice.totalPrize.toString(),
                      style: TextStyle(
                          color: Black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'د.ل ',
                      style:
                          TextStyle(color: Black.withOpacity(.7), fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .14),
              child: Text(
                invoice.releaseDate.toString(),
                textDirection: TextDirection.rtl,
                style: TextStyle(fontSize: 12, color: Black.withOpacity(.5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
