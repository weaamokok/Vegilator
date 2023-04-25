import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegilator/src/domain/models/vegetable.dart';
import 'package:vegilator/src/presentation/cubits/cubit/vegetabes_cubit.dart';
import 'package:vegilator/src/utils/constants/colors.dart';
import '../../widgets/add_card.dart';
import '../../widgets/inventory_vegetable_card.dart';
import '../../widgets/searchbar.dart';
import 'addVegetablesForm.dart';

List<Vegetable> veges = [];

File? _image;
final picker = ImagePicker();
String? im;
void openAddVegetbleForm(context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: (context),
    builder: (context) => addVegetableForm(),
  );
}

Future<String> convertToString() async {
  final ByteData bytes = await rootBundle.load('images/tomato 1.png');

  final Uint8List list = bytes.buffer.asUint8List();
  im = base64Encode(list);
  return base64Encode(list);
}

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  void initState() {
    super.initState();
    convertToString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBarFirst(context),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .050,
              vertical: MediaQuery.of(context).size.width * .050),
          child: SearchBar(event: () {}),
        ),
        BlocBuilder<VegetabesCubit, VegetabesState>(builder: (_, state) {
          switch (state.runtimeType) {
            case VegetablesLoading:
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            case VegetablesSuccess:
              return _buildInventoryVegetables(state.vegetables, context);
            default:
              return const SizedBox();
          }
        })
      ],
    );
  }
}

Widget _buildInventoryVegetables(List<Vegetable> veges, context) {

  if (veges.isEmpty) {
    return Align(
      alignment: Alignment.centerLeft,
      child: addCard(),
    );
  }
  return Expanded(
    child: Wrap(
      children: [
        GridView.builder(
          padding: EdgeInsets.all(15),
          shrinkWrap: true,
          itemCount: veges.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
          itemBuilder: (context, index) =>
              InventoryVegetableCard(vege: veges[index]),
        ),
        Container(width:210,child: addCard())
      ],
    ),
  );
}

Widget CustomAppBarFirst(context) {
  return Container(
    height: 100,
    child: AppBar(
      elevation: 5,
      shadowColor: Colors.black54,
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            openAddVegetbleForm(context);
          },
          icon: Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * .03),
        )
      ],
      title: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
        child: Text('بضاعة المحل',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
      ),
    ),
  );
}
