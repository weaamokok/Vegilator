import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({required this.title, this.topIcon});
  final String title;
  final IconData? topIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: AppBar(
        elevation: 5,
        shadowColor: Colors.black54,
        centerTitle: true,
        actions: topIcon != null
            ? [
                IconButton(
                  onPressed: () {},
                  icon: Icon(topIcon, size: 30),
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .03),
                )
              ]
            : null,
        title: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * .03),
          child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
