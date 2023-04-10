import 'package:flutter/material.dart';
import 'package:vegilator/src/domain/models/invoice.dart';
import 'package:vegilator/src/presentation/widgets/UI_elements/zigzag.dart';

import '../../../utils/constants/colors.dart';
import '../UI_elements/dashed_line.dart';

class InvoicePaper extends StatelessWidget {
  const InvoicePaper({required this.invoice});
  final Invoice invoice;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .050),
          decoration: BoxDecoration(
              color: Color(0xffF6F7F6),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25), topLeft: Radius.circular(25))),
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
                child: ListView.builder(
                  shrinkWrap: true,
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
      ],
    );
  }
}
