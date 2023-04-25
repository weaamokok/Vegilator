import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:retrofit/http.dart';
import 'package:vegilator/src/config/router/app_router.dart';
import 'package:vegilator/main.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/presentation/cubits/cubit/vegetabes_cubit.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/extentions/helperFuntions.dart';

class addVegetableForm extends StatefulWidget {
  const addVegetableForm({super.key});

  @override
  State<addVegetableForm> createState() => _addVegetableFormState();
}

class _addVegetableFormState extends State<addVegetableForm> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController nameCon=TextEditingController();
  final TextEditingController buyingPrizeCon=TextEditingController();
  final TextEditingController salingPrizeCon=TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vegetabesCubit=BlocProvider.of<VegetabesCubit>(context);
    return Container(padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.04),
        child: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(icon:  Icon(MdiIcons.close,color: Black.withOpacity(.8),), onPressed: () {appRouter.pop();}),
        ), SizedBox(
          height: MediaQuery.of(context).size.height*.05,
        ),
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.center,
              child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      _image != null ? FileImage(_image as File) : null,
                  backgroundColor:
                      _image == null ? Orange.withOpacity(.5) : null),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .33),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    _showSelectionDialog();
                  },
                  child: CircleAvatar(
                    backgroundColor: Orange,
                    child: Icon(Icons.edit, color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        ), SizedBox(
          height: MediaQuery.of(context).size.height*.04,
        ),
        SizedBox(
          width: 200,
          child: TextFormField(textAlign: TextAlign.right,controller: nameCon,
              decoration: InputDecoration(
                  hintText: 'إسم الصنف',hintStyle: TextStyle(color: Black.withOpacity(.5)),
                  hintTextDirection: TextDirection.rtl,
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: PrimaryGreen,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: PrimaryGreen,
                      width: 2,
                    ),
                  ))),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*.01,
        ),
        SizedBox(
          width: 200,
          child: TextFormField(textAlign: TextAlign.right,controller: buyingPrizeCon,
              decoration: InputDecoration(
                  hintText: "سعر الشراء للكيلو",hintStyle: TextStyle(color: Black.withOpacity(.5)),
                  //  prefixText: 'fd',
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'دينار',
                        style: TextStyle(color: Black.withOpacity(.3)),
                      )),
                  hintTextDirection: TextDirection.rtl,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: PrimaryGreen,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: PrimaryGreen,
                      width: 2,
                    ),
                  ))),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*.01,
        ),
        SizedBox(
          width: 200,
          child: TextFormField(textAlign: TextAlign.right,controller: salingPrizeCon,
              decoration: InputDecoration(
                  hintText: "سعر البيع للكيلو",hintStyle: TextStyle(color: Black.withOpacity(.5)),
                  //  prefixText: 'fd',
                  prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'دينار',
                        style: TextStyle(color: Black.withOpacity(.3)),
                      )),
                  hintTextDirection: TextDirection.rtl,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: PrimaryGreen,
                      width: 2,
                    ),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: PrimaryGreen,
                      width: 2,
                    ),
                  ))),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height*.04,
        ),
        InkWell(onTap: (){
          String imageFile;
        imageFile= converImageToString(_image!);
          vegetabesCubit.addVegetable(vege: Vegetable( name: nameCon.text, image:imageFile , buyingPrizePerKg:int.parse(buyingPrizeCon.text) , salePrizePerKg:int.parse(salingPrizeCon.text))).whenComplete(() => appRouter.pop());
        },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            child: Text('حفظ الصنف', textAlign: TextAlign.center,style: TextStyle(color: Colors.white),),
            width: MediaQuery.of(context).size.width * .3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: PrimaryGreen),
            height: 40,
          ),
        ), SizedBox(
          height: MediaQuery.of(context).size.height*.02,
        ), GestureDetector(child: Text('إالغاء العملية',style: TextStyle(color: Black.withOpacity(.7),fontSize: 13,),),)
        // TextFormField()
      ],
    ));
  }

  Future selectOrTakePhoto(ImageSource imageSource) async {
    final pickedFile = await picker.getImage(source: imageSource);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else
        print('No photo was selected or taken');
    });
  }

  Future _showSelectionDialog() async {
    await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select photo'),
        children: <Widget>[
          SimpleDialogOption(
            child: Text('From gallery'),
            onPressed: () {
              selectOrTakePhoto(ImageSource.gallery);
              Navigator.pop(context);
            },
          ),
          SimpleDialogOption(
            child: Text('Take a photo'),
            onPressed: () {
              selectOrTakePhoto(ImageSource.camera);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
