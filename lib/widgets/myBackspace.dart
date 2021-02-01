
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:calculator/Home.dart';
import 'myCustBTN.dart';

  class MyBackspace extends StatelessWidget {

    // final String exp ;

    final Function exp;

  const MyBackspace(this.exp) ;

      @override
      Widget build(BuildContext context) {
        return myCustBTN(exp,
            Icons.backspace_outlined
        );
      }

    }
