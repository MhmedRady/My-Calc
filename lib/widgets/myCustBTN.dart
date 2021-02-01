
import 'package:calculator/Consts.dart';
import 'package:flutter/material.dart';
import 'package:calculator/history.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:calculator/Home.dart';

class myCustBTN extends StatelessWidget {

  final Function onPressing;
  final Object myIcon;
  myCustBTN(this.onPressing, this.myIcon);

  @override
  Widget build(BuildContext context) {
     // = Icons.backspace_outlined;
    return
      RawMaterialButton(
        onPressed: onPressing,
        fillColor: Color(0xFF4C4F),
        elevation: 5.5,
        disabledElevation: 6.5,
        child: Icon(myIcon, size: 30,color: Color(0xFF00c1e6),),
        shape: CircleBorder(),
        constraints: BoxConstraints.tightFor(
            width: 56.0,height: 56.0),
      );
  }
}
