import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

var setResults = [];

void myResults(var listValues) {
  setResults = listValues;
  print("Function => $setResults");
}

class MyChanges {
  bool isPresent(String inClickNum) {
    List ast = ["+", "*", "/", "-"];
    return ast.contains(inClickNum);
  }

  myBodyBackG() {
    return BoxDecoration(
      gradient: LinearGradient(
          // BODY COLORS
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xFF252525),
            Color(0xFF222222),
            Color(0xFF212121)
          ]),
    );
  }

  myTextStyle(double tSize, int colorz,
      [bool undLine = true, var fWeight = FontWeight.w900]) {
    var val = TextDecoration.none;
    if (!undLine) {
      val = TextDecoration.underline;
    }
    // MyChanges().myTextStyle(25, 0xFFEEEEEE,false)
    return TextStyle(
        decoration: val,
        fontSize: tSize,
        fontWeight: fWeight,
        fontFamily: 'Lobster',
        color: Color(colorz),
        shadows: <Shadow>[
          Shadow(
            offset: Offset(5.0, 5.0),
            blurRadius: 3.0,
            color: Color(0xFF000000).withOpacity(0.2),
          ),
        ]);
  }

  myButtonRadius(int funRadius) {
    var R = BorderRadius.zero;
    // int myMargin;
    if (funRadius != 0) {
      switch (funRadius) {
        case 1:
          R = BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0));
          break;
        case 2:
          R = BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0));
          break;
        case 3:
          R = BorderRadius.only(
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(100),
              topLeft: Radius.circular(100),
              bottomRight: Radius.circular(100));
          // myMargin = 10;
          break;
      }
    }
    return R;
  }

  myButtonMargin(int customMargin) {
    double myMargin = customMargin == 3 ? 10.0 : 0.0;
    return myMargin;
  }

  myNavPage(BuildContext context, Object object()) {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => object()));
  }

  var alertStyle = AlertStyle(
    animationType: AnimationType.fromBottom,
    isCloseButton: true,
    isOverlayTapDismiss: true,
    descStyle: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Lobster'),
    descTextAlign: TextAlign.center,
    animationDuration: Duration(milliseconds: 300),
    alertBorder: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: BorderSide(
        color: Colors.grey,
      ),
    ),
    titleStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Lobster',
        color: Color(0xFF4444444),
        fontSize: 20),
    alertAlignment: Alignment.center,
  );
}
