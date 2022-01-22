import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(this.childWigdet);

  final Widget childWigdet;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        const Image(
          image: AssetImage('assets/images/backgroun_main_scree.png'),
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Align(alignment: Alignment.topLeft, child: childWigdet),
        ),
      ],
    );
  }
}
