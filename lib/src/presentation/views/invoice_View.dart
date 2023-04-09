import 'package:flutter/material.dart';
import 'package:vegilator/src/domain/models/invoice.dart';
import 'package:vegilator/src/presentation/widgets/icon_text_card.dart';
import 'package:vegilator/src/utils/constants/colors.dart';

import '../widgets/dashed_line.dart';
import '../widgets/zigzag.dart';

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
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .050),
                decoration: BoxDecoration(
                    color: Color(0xffF6F7F6),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .020,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .050),
                      child: Text(
                        'تفاصيل المشتريات',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width * .040),
                    const MySeparator(),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * .020,
                          horizontal: MediaQuery.of(context).size.width * .020),
                      width: double.infinity,
                      height: 300,
                      child: ListView.builder(
                        itemCount: invoice.veges?.length,
                        itemBuilder: (context, index) => Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          textDirection: TextDirection.rtl,
                          children: [
                            Image(image: invoice.veges![index].vege.image),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(invoice.veges![index].vege.name),
                                Text(invoice.veges![index].amount.toString()),
                              ],
                            ),
                            Text(invoice.veges![index].prize.toString())
                          ],
                        ),
                      ),
                    ),
                    const MySeparator(),
                    Container(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * .020,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'مجموع المشتريات :',
                                textDirection: TextDirection.rtl,
                              ),
                              Text(invoice.sumOfVegetablePrize.toString())
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            textDirection: TextDirection.rtl,
                            children: [
                              Text(
                                'خصم:',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(color: PrimaryGreen),
                              ),
                              Text(
                                invoice.discount.toString(),
                                style: TextStyle(color: PrimaryGreen),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const MySeparator(),
              SizedBox(
                child: ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: 60,
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .050),
                      alignment: Alignment.center,
                      color: PrimaryGreen.withOpacity(.5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text('المجموع:',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(invoice.totalPrize.toString() + '  د.ل ',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ],
                      ),
                    )),
              ),
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
