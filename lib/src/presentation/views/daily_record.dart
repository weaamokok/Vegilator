import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:vegilator/src/domain/models/purchase.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/domain/models/purchasedVegetables.dart';
import 'package:vegilator/src/presentation/widgets/invoice_related_widgets/invoice_widget.dart';

import '../../utils/constants/colors.dart';
import '../widgets/app_bar.dart';
import 'daily_purchases/adding_purchase_view.dart';
import 'date_view_in_daily_record.dart';
import 'inventory_view.dart';

List<PurchasedVegetables> vagetablesList = [
  PurchasedVegetables(id: 1, purchaseId: 2, amount: 1.5, prize: 12, vegeID: 1),
  PurchasedVegetables(id: 10, purchaseId: 2, amount: 1.5, prize: 12, vegeID: 1)
];

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
                        style: TextStyle(color: Black, fontSize: 13),
                      ),
                      Row(
                        children: [
                          Text(
                            '180 ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Black.withOpacity(.8)),
                          ),
                          Text(
                            'د.ل',
                            style: TextStyle(
                                fontSize: 14, color: Black.withOpacity(.8)),
                          ),
                        ],
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
                      invoice: Purchase(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          veges: vagetablesList,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Purchase(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Purchase(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Purchase(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Purchase(
                          serialNum: '#8979A',
                          totalPrize: 150.0 as double,
                          releaseDate: '2:10 مساءاَ')),
                  SizedBox(
                    height: 10,
                  ),
                  InvoiceWidget(
                      invoice: Purchase(
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
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddingPurchaseView(),
                    ));
              },
              child: Icon(Icons.add, size: 30),
              backgroundColor: PrimaryGreen,
            ),
          ),
        )
      ],
    );
  }
}
