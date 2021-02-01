import 'package:calculator/widgets/CalcButton.dart';
import 'package:calculator/widgets/myColView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Consts.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Home.dart';
import 'dart:math';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class MyLife extends StatefulWidget {
  @override
  _MyLifeState createState() => _MyLifeState();
}

class _MyLifeState extends State<MyLife> {
  String NDD, NMM, NYY;
  String SDD = "DD";
  String SMM = "MM";
  String SYY = "YY";

  String ADD = "DD";
  String AMM = "MM";
  String AYY = "YY";

  // String MDD = "DD";
  // String MMM = "MM" ;
  // String MYY = "YY";

  DateTime tryDate;

  DateTime dNow = DateTime.now();

  Future<dynamic> clned(String text) async {
    DateTime newDateTime = await showRoundedDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year + 1),
      borderRadius: 16,
      fontFamily: 'Lobster',
      textActionButton: "TenCent",
      theme: ThemeData.dark(),
    );
    tryDate = newDateTime;
    myBirth(newDateTime);
    return newDateTime;
  }

  void myBirth(DateTime date) {
    setState(() {
      SYY = getDate(date)[0];
      SMM = getDate(date)[1];
      SDD = getDate(date)[2];
      print("String => $SDD / $SMM / $SYY");
    });
  }

  getDate(DateTime date) {
    String outCont;
    List<Object> dateNow = [];
    dateNow = date.toString().split(" ");
    outCont = dateNow.first;
    dateNow = outCont.split("-");
    return dateNow;
  }

  getCurrentDate(DateTime date) {
    getDate(date);
    NDD = getDate(dNow)[2];
    NMM = getDate(dNow)[1];
    NYY = getDate(dNow)[0];
  }

  myAlert([
    String I = "image/Alert.jpg",
    String T = "Insert Your Birth Date !!",
    String D = "Your Date Of Birth Not Inserted Set It first.",
  ]) {
    return Alert(
      context: context,
      title: T,
      style: MyChanges().alertStyle,
      desc: D,
      buttons: [],
      image: Image.asset(
        I,
        width: 200,
        height: 200,
      ),
    ).show();
  }

  String nextBM;
  String nextBD;

  calculateMyAge(String cDay) {
    setState(() {
      if (SDD == "DD" || SMM == "MM" || SYY == "YY") {
        // "image/cake.png"
        myAlert();
      } else {
        int outDD = int.parse(SDD);
        int outMM = int.parse(SMM);
        int outYY = int.parse(SYY);
        int outNYY = int.parse(NYY);
        int outNMM = int.parse(NMM);
        int outNDD = int.parse(NDD);

        nextBM = (outMM - 1 + (12 - outNMM)).toString();
        nextBD = (outDD + (30 - outNDD)).toString();

        print("Birthday => $nextBM  => $nextBD");

        print("day $outMM -> $outNMM");
        print("year $nextBM");

        int outDay, outMonth, outYear;

        if (outDD > outNDD) {
          outNDD = outNDD + 30;
          outNMM = outNMM - 1;
          outDay = outNDD - outDD;
          print("S");
        } else {
          print("L");
          outDay = outNDD - outDD;
        }
        if (outMM > outNMM) {
          outNMM = outNMM + 12;
          outNYY = outNYY - 1;
          outMonth = outNMM - outMM;
        } else {
          outMonth = outNMM - outMM;
        }
        outYear = outNYY - outYY;
        ADD = outDay.toString();
        AMM = outMonth.toString();
        AYY = outYear.toString();

        print("outYear $outYear");
        print("out Month => $outMonth");
        print("out Day => $outDay");
        print("Date");
      }
    });
  }

  nextBirth(String DD) {
    setState(() {
      if (SDD == "DD" || SMM == "MM" || SYY == "YY") {
        myAlert();
      } else {
        int outDD  = int.parse(SDD);
        int outMM  = int.parse(SMM);   // => Birth
        int outNMM = int.parse(NMM); // => Now
        int outNDD = int.parse(NDD);
        
        if (outNMM > outMM) {
          nextBM = (outMM - 1 + (12 - outNMM)).toString();
        } else {
          nextBM = (outMM-outNMM).toString();
        }
        
        nextBD = (outDD + (30 - outNDD)).toString();
        print("Next Month => $outMM / $outNMM");
        myAlert("image/cake.png", "We'll tell you happy birthday after !!",
            " $nextBD Day & $nextBM Month");
      }
    });
  }

  ageCalcBTN(String text, int radius, Function fun, [int color = 0xFF0068BB]) {
    return CalcButton(
      WH: 45,
      text: text,
      radius: radius,
      fillColor: color,
      textColor: 0xFFFFFFFF,
      textSize: 20,
      mathClick: fun,
    );
  }

  @override
  Widget build(BuildContext context) {
    getCurrentDate(dNow);

    return Scaffold(
      backgroundColor: Color(0xFF0E6D68),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromRGBO(6, 88, 108, 1),
          // Color(0xFF252525),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.calendar,
                size: 30,
                color: Color(0xFF00c1e6),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Age Calculator",
                  style: MyChanges().myTextStyle(25, 0xFFFfFFFF, false),
                ),
              )
            ],
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              onPressed: () {
                setState(() {
                  SYY = AYY = "YY";
                  SMM = AMM = "MM";
                  SDD = ADD = "DD";
                });
              },
              icon: Icon(Icons.cached, size: 30, color: Color(0xFF00c1e6)),
            ),
          ]),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(6, 88, 108, 1),
                  Color.fromRGBO(14, 109, 104, 1),
                  Color.fromRGBO(0, 212, 255, .3)
                ]),
          ),
          // MyChanges().myBodyBackG(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("image/can.png"),
                        colorFilter: ColorFilter.mode(
                            Color.fromRGBO(255, 255, 255, 0.5),
                            BlendMode.modulate),
                      ),
                      color: Color.fromRGBO(153, 153, 153, 1),
                      // color: Color(0xff0E6D68),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomCenter,
                          colors: [
                            // Color.fromRGBO(19,19,19,9),
                            // Color.fromRGBO(55,55,55,9),
                            // Color.fromRGBO(38,38,38,9)
                            Color.fromRGBO(255, 255, 255, 1),
                            Color.fromRGBO(221, 221, 221, .77),
                            Color.fromRGBO(153, 153, 153, .4)
                          ]),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage("image/age+.png"),
                          alignment: Alignment.center,
                          width: 120,
                          height: 120,
                        ),
                        Expanded(
                          child: ListView(
                            children: [
                              MyColView("Current Date", NDD, NMM, NYY, false,
                                  clned, true),
                              MyColView("Your Date Of Birth", SDD, SMM, SYY,
                                  true, clned, true),
                              MyColView(
                                  "My Age", ADD, AMM, AYY, false, clned, false),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: ageCalcBTN(
                                        "Calculate Age", 3, calculateMyAge),
                                    width: 150,
                                    margin: EdgeInsets.all(0),
                                  ),
                                  Container(
                                    child: ageCalcBTN(
                                        "Next Birth", 3, nextBirth, 0xFFb70934),
                                    width: 150,
                                    margin: EdgeInsets.all(0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
              ),
            ],
          )),
    );
  }
}
