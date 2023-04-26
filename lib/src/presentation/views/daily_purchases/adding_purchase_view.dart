import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../utils/constants/colors.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/searchbar.dart';

class AddingPurchaseView extends StatelessWidget {
  const AddingPurchaseView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.black54,
        title: const Text('إضافة عملية شراء'),
        leading: const Icon(MdiIcons.close),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .050,
            vertical: MediaQuery.of(context).size.width * .050),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: TextDirection.rtl,
            children: [
              const SearchBar(
             readOnly: true,
              ),
              SizedBox(height: MediaQuery.of(context).size.width * .050),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'تم شراءها مؤخراً',
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .005,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * .020,
                    horizontal: MediaQuery.of(context).size.height * .020,
                  ),
                  decoration: BoxDecoration(
                      //color: ,changes when state of checkness changess
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: PrimaryGreen)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    textDirection: TextDirection.rtl,
                    children: [
                      Checkbox(
                          value: false,
                          onChanged: (h) {},
                          activeColor: PrimaryGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      const Image(image: AssetImage('images/tomato 1.png')),
                      const Text(
                        'طماطم',
                        style: TextStyle(fontSize: 12),
                      ),
                      const Text(
                        '1 ' 'د/الكيلو ',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
