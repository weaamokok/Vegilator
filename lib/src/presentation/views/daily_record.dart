import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vegilator/src/domain/models/invoice.dart';
import 'package:vegilator/src/presentation/widgets/invoice_widget.dart';

import '../../utils/constants/colors.dart';
import '../widgets/app_bar.dart';
import 'date_view_in_daily_record.dart';

class DailyRecord extends StatelessWidget {
  const DailyRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            CustomAppBar(title: 'عمليات الشراء اليومية'),
            DateViewInDailyRecord(),
            Container(
              margin: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * .020),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'مجموع المبيعات',
                        style: TextStyle(color: Black),
                      ),
                      Text(
                        '180 ' + 'د.ل',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Black.withOpacity(.8)),
                      )
                    ]),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .050),
                children: [
                  InvoiceWidget(
                      invoice: Invoice(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Invoice(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Invoice(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Invoice(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Invoice(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Invoice(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ'))
                ],
              ),
            ),
            //add floating button and the layout of the operation
          ],
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add, size: 30),
              backgroundColor: PrimaryGreen,
            ),
          ),
        )
      ],
    );
  }
}
