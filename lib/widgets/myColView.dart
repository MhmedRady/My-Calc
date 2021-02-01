import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Consts.dart';
import 'CalcButton.dart';
import 'myElevation.dart';

class MyColView extends StatelessWidget {
  final String hTitle;
  final dd, mm, yy;
  final row;
  final bool textDecor;
  final Function setBarth;
  MyColView(this.hTitle, this.dd, this.mm, this.yy, this.row, this.setBarth,
      this.textDecor)
      : assert(hTitle != null);

  @override
  Widget build(BuildContext context) {
    getDateBTN([bool setRow = false]) {
      if (setRow)
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5, bottom: 10),
              child: myElevation(
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: MyChanges().myButtonRadius(3),
                  ),
                  onPressed: () {
                    setBarth(hTitle);
                  },
                  child: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.birthdayCake,
                        size: 30,
                        color: Color(0xFF404040),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Set Your Birth",
                          style: MyChanges().myTextStyle(24, 0xFF022d90, false),
                        ),
                      ),
                    ],
                  ),
                  color: Color.fromRGBO(221, 221, 221, 9),
                ),
                height: 40,
                myElevateRadius: 3,
              ),
            )
          ],
        );
      return Row();
    }

    textDate(String DName, [int color = 0xFF252525, textDecor = true]) {
      return Text(
        DName,
        textAlign: TextAlign.center,
        style: MyChanges().myTextStyle(25, color, textDecor),
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(1),
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(4, 140, 168, .6),
              borderRadius: MyChanges().myButtonRadius(1),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Color.fromRGBO(4, 140, 168, .8).withOpacity(0.5),
                  blurRadius: 5,
                  offset: Offset(0, -4),
                ),
              ],
            ),
            margin: EdgeInsets.only(top: 30),
            width: MediaQuery.of(context).size.width - 50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(hTitle,
                  textAlign: TextAlign.center,
                  style: MyChanges()
                      .myTextStyle(30, 0xFFEEEEEE, false, FontWeight.w400)),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(221, 221, 221, .6),
            borderRadius: MyChanges().myButtonRadius(2),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Color(0xFF888888).withOpacity(0.4),
                blurRadius: 2,
                offset: Offset(0, 8),
              ),
            ],
          ),
          margin: EdgeInsets.only(top: 00),
          width: MediaQuery.of(context).size.width - 50,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        textDate("Day"),
                        textDate(dd, 0xFF404040, textDecor),
                      ],
                    ),
                    Column(
                      children: [
                        textDate("Month"),
                        textDate(mm, 0xFF404040, textDecor),
                      ],
                    ),
                    Column(
                      children: [
                        textDate("Year"),
                        textDate(yy, 0xFF404040, textDecor),
                      ],
                    ),
                  ],
                ),
              ),
              getDateBTN(row),
            ],
          ),
        ),
      ],
    );
  }
}
