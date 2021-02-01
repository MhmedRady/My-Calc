import 'dart:math';
import 'dart:ui';
import 'dart:convert';

import 'package:calculator/widgets/myAgeBTN.dart';
import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/Consts.dart';
import 'package:calculator/widgets/CalcButton.dart';
import 'package:calculator/widgets/HistoryButton.dart';
import 'package:calculator/widgets/myElevation.dart';
import 'package:calculator/widgets/myBackspace.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class CalcApp extends StatefulWidget {
  const CalcApp({Key key}) : super(key: key);
  @override
  CalcAppState createState() => CalcAppState();
}

class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '0';
  int val;
  String M = "0";
  bool equale = false;
  bool Asts = false;

  numClick(String text) {
    if (_expression == '0') {
      _expression = '';
    }
    val = _expression.length;
    bool checkClick = MyChanges().isPresent(text);
    print(val);
    if (val != 40) {
      if (!checkClick) {
        _expression = equale == true ? '' : _expression;
      }
      equale = false;
      setState(() => _expression += text);
    }
  }

  void allClear(String text) {
    setState(() {
      _history = '';
      _expression = '0';
    });
  }

  void clear(String text) {
    setState(() {
      _expression = '0';
    });
  }

  visibleNumbers(String numb) {
    return CalcButton(
      //  NUMBERS
      // 0384ad
      WH: 65,
      text: numb,
      fillColor: 0xFF202020,
      textSize: 24,
      mathClick: numClick,
    );
  }

  asterisk(String ast, int radius) {
    // % / x
    // print(equale);

    return CalcButton(
      WH: 65,
      text: ast,
      radius: radius,
      fillColor: 0xFF16212c,
      textColor: 0xFFFFFFFF,
      textSize: 20,
      mathClick: numClick,
    );
  }

  myMath(String ast, int radius) {
    return asterisk(ast, radius);
  }

  outMemory(String ast, int radius) {
    return CalcButton(
      WH: 65,
      text: ast,
      radius: radius,
      fillColor: 0xFF16212c,
      textColor: 0xFFFFFFFF,
      textSize: 20,
      mathClick: numClick,
      M: M,
    );
  }

  var send = [];
  void evaluate(String text) {
    equale = true;
    String maths, values;
    Parser p = Parser();
    List ex = _expression.split('');
    print(ex);
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    setState(() {
      if (_expression.length != null) {
        _history = _expression;
        maths = _history;

        _expression = exp.evaluate(EvaluationType.REAL, cm).toString();
        values = "= $_expression";
        if (maths != null && values != null) {
          send.add(maths + " " + values);
          myResults(send);
        }
      }
    });
  }

  myBackspace(String outState) {
    var concatenate = StringBuffer();
    List<String> tryList = [];
    setState(() {
      tryList = outState.split("");
      if (tryList.isNotEmpty) {
        tryList.removeAt(tryList.length - 1);
        tryList.forEach((item) {
          concatenate.write(item);
        });
        // tryList = tryList.length==0?_expression="0":tryList;
      }
      _expression = tryList.length != 0 ? concatenate.toString() : "0";
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'), // English
        const Locale('ar ', 'AR'), // Thai
      ],
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      home: Scaffold(
        backgroundColor: Color(0xFF252525),
        // appBar: AppBar(
        //   backgroundColor: Color(0xFF2e3440),
        //   title: Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       // action button
        //       IconButton(icon: Image.asset('image/CALC.png')),
        //       Text("Flutter "),
        //       Text(
        //         "Calculator",
        //         style: TextStyle(
        //             fontFamily: 'Lobster',
        //             color: Color(0xFF1fa782),
        //             fontWeight: FontWeight.w900),
        //       ),
        //       Divider(color: Colors.white),
        //     ],
        //   ),
        //   centerTitle: true,
        //   elevation: 0,
        // ),
        body: Container(
          decoration: MyChanges().myBodyBackG(),
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        // AGE BTN
                        child: myAgeBTN(),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        // HISTORY BTN
                        child: HistoryButton(
                          send.length,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        // BACKSPACE BTN
                        child: MyBackspace(() {
                          myBackspace(_expression);
                        }),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                // CALC HISTORY
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(40.0)
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        // Color.fromRGBO(25, 22, 22, 1),
                        // Color.fromRGBO(49, 49, 49, 1),
                        // Color.fromRGBO(24, 24, 24, .7)
                        Color(0xFF252525),
                        Color(0xFF222222),
                        Color(0xFF212121)

                        // Color(0xFF0494b1),
                        // Color(0xFF0055a3),
                        // Color(0xFF59a19f)
                      ]),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Color(0xFF050505).withOpacity(0.5),
                      blurRadius: 10,
                      offset: Offset(10, -15),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Text(
                    _history,
                    style: MyChanges().myTextStyle(25, 0xFFddddddd),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              Container(
                height: 5,
                width: double.infinity,
                color: Color(0xff0a508b),
              ),
              Container(
                // CALC BORD COLORS

                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color(0xFF313131),
                          Color(0xFF313131),
                          Color(0xFF303030)
                        ]),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Color(0xFF050505).withOpacity(0.5),
                        blurRadius: 5,
                        offset: Offset(7, 10),
                      ),
                    ],
                    // color: Color(0xff0494b1),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0.0),
                      bottomRight: Radius.circular(50.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: new SingleChildScrollView(
                    child: Text(
                      _expression,
                      style: MyChanges().myTextStyle(30, 0xFFFFFFFF),
                    ),
                  ),
                ),
                alignment: Alignment(1.0, 1.0),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    WH: 65,
                    text: 'AC',
                    radius: 3,
                    fillColor: 0xFF022d90,
                    textSize: 20,
                    mathClick: allClear,
                  ),
                  CalcButton(
                    WH: 65,
                    text: 'C',
                    radius: 3,
                    textSize: 20,
                    fillColor: 0xFFb42525,
                    mathClick: clear,
                  ),
                  // MEMORY BTN
                  asterisk("1/x", 1),
                  asterisk("√x", 1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  asterisk("(", 1),
                  asterisk(")", 1),
                  asterisk("%", 2),
                  asterisk("/", 2),
                ],
              ),
              Divider(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  visibleNumbers("7"),
                  visibleNumbers("8"),
                  visibleNumbers("9"),
                  asterisk("X", 1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  visibleNumbers("4"),
                  visibleNumbers("5"),
                  visibleNumbers("6"),
                  CalcButton(
                    text: '-',
                    WH: 65,
                    fillColor: 0xFFf76707,
                    textColor: 0xFFFFFFFF,
                    textSize: 38,
                    mathClick: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  visibleNumbers("1"),
                  visibleNumbers("2"),
                  visibleNumbers("3"),
                  CalcButton(
                    text: '+',
                    WH: 65,
                    fillColor: 0xFFf76707,
                    textColor: 0xFFffffff,
                    textSize: 30,
                    mathClick: numClick,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  visibleNumbers("."),
                  visibleNumbers("0"),
                  CalcButton(
                    text: '00',
                    fillColor: 0xFF0b7285,
                    mathClick: numClick,
                    textSize: 24,
                    WH: 65,
                  ),
                  CalcButton(
                    WH: 65,
                    text: '=',
                    radius: 2,
                    textSize: 22,
                    fillColor: 0xFF022d90,
                    textColor: 0xFFFFFFFF,
                    mathClick: evaluate,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
