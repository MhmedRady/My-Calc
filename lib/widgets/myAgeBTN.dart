
import 'package:calculator/Consts.dart';
import 'package:flutter/material.dart';
import 'package:calculator/age.dart';
import 'myCustBTN.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class myAgeBTN extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return myCustBTN((){
         MyChanges().myNavPage(context, () => MyLife());
     },
       FontAwesomeIcons.heartbeat,
     );
   }
 }
