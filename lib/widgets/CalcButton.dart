import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calculator/Consts.dart';
import 'myElevation.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int fillColor;
  final int textColor;
  final double textSize,WH;
  final int radius;
  final String M,expression;
  final Function mathClick;

  const CalcButton({
    Key key,
    this.radius,
    this.text,
    this.fillColor,
    this.textColor = 0xFFFFFFFF,
    this.textSize,
    this.mathClick,
    this.M,
    this.expression,
    this.WH,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var myMargin = MyChanges().myButtonMargin(radius);
    var ast = text;
    var R = MyChanges().myButtonRadius(radius);

    return Container(

      margin: EdgeInsets.only(top: myMargin,bottom: myMargin),
      child: SizedBox(
        width: WH,
        height: WH,
        child: myElevation(
          child: FlatButton(
            shape: RoundedRectangleBorder(

              borderRadius: R,
            ),

            onPressed: () {
              ast = text=="X"?"*":text;
              // ast = ast =="x²"?"²":ast;
              int N= 2;
              ast = ast =="1/x"? "(1/":ast;
              ast = ast =="√x"?"sqrt(":ast;
              mathClick(ast);
            },
            child: Text(
              text,
              style: MyChanges().myTextStyle(textSize,0xFFFFFFFF),
              ),
            color: fillColor != null ? Color(fillColor) : null,
            textColor: Color(textColor),
          ),
          height: 100.0,
          myElevateRadius: radius,
        ),
      ),
    );
  }
}
