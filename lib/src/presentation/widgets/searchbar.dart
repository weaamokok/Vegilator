import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({required this.readOnly,this.eventOnChange});
  final bool readOnly;
  final Function? eventOnChange;

  @override
  Widget build(BuildContext context) {
    return TextFormField( onChanged:(value) =>  eventOnChange!(value),
      textDirection: TextDirection.rtl,
      cursorColor: Orange.withOpacity(.5),enabled: readOnly,
      decoration: InputDecoration(
          hintText: 'ابحث بإسم الخضرة ...',
          hintTextDirection: TextDirection.rtl,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          prefixIcon: new Icon(Icons.search, color: Grey, size: 30),
          focusColor: Orange.withOpacity(.5),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Orange.withOpacity(.5))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Grey, width: 1)),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Grey, width: 1)), //orang from constants
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))),
    );
  }
}
