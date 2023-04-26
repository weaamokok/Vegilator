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
import 'package:vegilator/src/config/router/app_router.gr.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/presentation/cubits/cubit/vegetabes_cubit.dart';
import 'package:vegilator/src/utils/constants/strings.dart';
import 'package:vegilator/src/utils/constants/widgets_styles.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/extentions/helperFuntions.dart';

class addVegetableForm extends StatefulWidget {
  const addVegetableForm({this.editVege});
  final Vegetable? editVege;

  @override
  State<addVegetableForm> createState() => _addVegetableFormState();
}

class _addVegetableFormState extends State<addVegetableForm> {
  File? _image;
  final picker = ImagePicker();
  final TextEditingController nameCon = TextEditingController();
  final TextEditingController buyingPrizeCon = TextEditingController();
  final TextEditingController salingPrizeCon = TextEditingController();
  // ignore: non_constant_identifier_names
  final _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final vegetabesCubit = BlocProvider.of<VegetabesCubit>(context);
    return Container(
        padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * .04),
        child: Form(
          key: _FormKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                    icon: Icon(
                      MdiIcons.close,
                      color: Black.withOpacity(.8),
                    ),
                    onPressed: () {
                      if (nameCon.text != '' ||
                          buyingPrizeCon.text != '' ||
                          salingPrizeCon.text != '' ||
                          _image != null) {
                        showDialog(
                            //save to drafts dialog
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text(
                                  'هل أنت متأكد من رغبتك في إلغاء العملية؟',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 15),
                                ),
                                content: const Text(
                                  'في حال قمت بالمتابعة لن يتم حفظ العنصر',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                                actions: [
                                  InkWell(
                                      onTap: () {
                                        appRouter.pop();
                                      },
                                      child: const Text(
                                        "المتابعة",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      )),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromARGB(255, 193, 58, 49),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: InkWell(
                                        onTap: () {
                                          appRouter.push(const Root());
                                        },
                                        child: const Text(
                                          'تجاهل التغيرات',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                ],
                                buttonPadding: const EdgeInsets.all(20),
                                actionsAlignment: MainAxisAlignment.spaceAround,
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 100),
                              );
                            });
                      } else {
                        appRouter.pop();
                      }
                    }),
              ),
             const Divider(color: Black,),
              SizedBox(
                height: MediaQuery.of(context).size.height * .05,
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        radius: 70,
                        backgroundImage: widget.editVege != null
                            ? MemoryImage(base64Decode(widget.editVege!.image))
                                as ImageProvider<Object>?
                            : _image != null
                                ? FileImage(_image as File)
                                : null,
                        backgroundColor:
                            _image == null && widget.editVege == null
                                ? Orange.withOpacity(.5)
                                : null),
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
                          child: const Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                    validator: (value) {
                      if (value == null || nameCon.text == '') {
                        return 'يجب كتابة اسم المنتج';
                      }
                      return null;
                    },
                    textAlign: TextAlign.right,
                    keyboardType: TextInputType.name,
                    controller: nameCon,
                    decoration: InputDecoration(
                        hintText: widget.editVege == null
                            ? 'إسم الصنف'
                            : widget.editVege!.name.toString(),
                        hintStyle: TextStyle(color: Black.withOpacity(.5)),
                        hintTextDirection: TextDirection.rtl,
                        contentPadding: EdgeInsets.symmetric(horizontal: 5),
                        focusedBorder: FieldUnderLineBorder,
                        enabledBorder: FieldUnderLineBorder)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                    textAlign: TextAlign.right,
                    controller: buyingPrizeCon,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || nameCon.text == '') {
                        return 'يجب تحديد سعر الشراء للمنتج';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: widget.editVege == null
                            ? "سعر الشراء للكيلو"
                            : widget.editVege!.buyingPrizePerKg.toString(),
                        hintStyle: TextStyle(color: Black.withOpacity(.5)),
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
                        focusedBorder: FieldUnderLineBorder,
                        enabledBorder: FieldUnderLineBorder)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                    textAlign: TextAlign.right,
                    controller: salingPrizeCon,
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || nameCon.text == '') {
                        return 'يجب تحديد سعر البيع للمنتج';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: widget.editVege == null
                            ? "سعر البيع للكيلو"
                            : widget.editVege!.salePrizePerKg.toString(),
                        hintStyle: TextStyle(color: Black.withOpacity(.5)),
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
                        focusedBorder: FieldUnderLineBorder,
                        enabledBorder: FieldUnderLineBorder)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              InkWell(
                onTap: () async {
                  String imageFile;
                  imageFile = converImageToString(_image !=
                          null //we are storing images as String in DB and here we convert them

                      ? _image
                      : await getImageFileFromAssets('images/default.png'));
                  if (widget.editVege == null) {
                    //make sure we are not updating
                    if (_FormKey.currentState!.validate()) {
                      vegetabesCubit
                          .addVegetable(
                              vege: Vegetable(
                                  name: nameCon.text,
                                  image: imageFile,
                                  buyingPrizePerKg:
                                      int.parse(buyingPrizeCon.text),
                                  salePrizePerKg:
                                      int.parse(salingPrizeCon.text)))
                          .whenComplete(() => appRouter.pop());
                    }
                  } else {
                    //here goes updating vegetable
                    vegetabesCubit
                        .updateVegetable(
                            vege: widget.editVege!.copyWith(
                          name: nameCon.text != ''
                              ? nameCon.text
                              : widget.editVege!.name.toString(),
                          image: _image != null
                              ? imageFile
                              : widget.editVege!.image,
                          buyingPrizePerKg: buyingPrizeCon.text != ''
                              ? int.parse(buyingPrizeCon.text)
                              : widget.editVege!.buyingPrizePerKg,
                          salePrizePerKg: salingPrizeCon.text != ''
                              ? int.parse(salingPrizeCon.text)
                              : widget.editVege!.salePrizePerKg,
                        ))
                        .whenComplete(() => appRouter.pop());
                  }
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Text(
                    'حفظ الصنف',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  width: MediaQuery.of(context).size.width * .3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: PrimaryGreen),
                  height: 40,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              GestureDetector(
                onTap: () => appRouter.pop(),
                child: Text(
                  'إالغاء العملية',
                  style: TextStyle(
                    color: Black.withOpacity(.7),
                    fontSize: 13,
                  ),
                ),
              )
              // TextFormField()
            ],
          ),
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
