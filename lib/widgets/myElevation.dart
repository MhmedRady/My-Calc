import 'package:calculator/Consts.dart';
import 'package:flutter/material.dart';

class myElevation extends StatelessWidget {
  final Widget child;
  final double height;
  final int myElevateRadius;

  myElevation({@required this.child, @required this.height,this.myElevateRadius})
      : assert(child != null);

  @override
  Widget build(BuildContext context) {
    var btnElevations = MyChanges().myButtonRadius(myElevateRadius);

    return Container(
      height: this.height,
      decoration: BoxDecoration(
        borderRadius: btnElevations,
        boxShadow: <BoxShadow>[

          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.2),
            blurRadius: 2,
            offset: Offset(5, 2),
          ),
        ],
      ),
      child: this.child,
    );
  }
}