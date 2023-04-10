import 'package:flutter/material.dart';
import 'package:vegilator/src/domain/models/invoice.dart';
import 'package:vegilator/src/presentation/widgets/icon_text_card.dart';
import 'package:vegilator/src/utils/constants/colors.dart';

import '../widgets/UI_elements/dashed_line.dart';
import '../widgets/invoice_related_widgets/invoice_paper.dart';
import '../widgets/UI_elements/zigzag.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView(this.invoice);
  final Invoice invoice;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              padding: EdgeInsets.all(40),
              icon: Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .080),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25))),
            child: Column(children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .050,
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'فاتورة',
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    invoice.serialNum.toString(),
                    style: TextStyle(fontSize: 23),
                  )
                ],
              ),
              Row(
                textDirection: TextDirection.rtl,
                children: [
                  Text(
                    'بتاريخ:',
                    textDirection: TextDirection.rtl,
                    style:
                        TextStyle(fontSize: 12, color: Black.withOpacity(.6)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    invoice.releaseDate.toString(),
                    style:
                        TextStyle(fontSize: 12, color: Black.withOpacity(.6)),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              InvoicePaper(invoice: invoice),
              SizedBox(
                height: MediaQuery.of(context).size.width * .050,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconTextCard(
                      onTap: () {},
                      icon: Icons.share,
                      text: 'مشاركة\nالفاتورة'),
                  SizedBox(
                    width: 15,
                  ),
                  IconTextCard(
                      onTap: () {}, icon: Icons.print, text: 'طباعة\nالفاتورة')
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .050,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
