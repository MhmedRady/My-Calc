
import 'package:calculator/Consts.dart';
import 'package:flutter/material.dart';
import 'package:calculator/history.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:calculator/Home.dart';
import 'myCustBTN.dart';

class HistoryButton extends StatelessWidget {

  final list;
  HistoryButton(this.list);

  @override
  Widget build(BuildContext context) {
    return myCustBTN((){
      if(list>0) {
        MyChanges().myNavPage(context, () => HistoryClass());
      }else{
          Alert(
            context: context,
            title: "Empty History Page !!",
            desc: "History Page Is Empty Do any calculation first.",
            buttons: [],
              image: Image.asset("image/Alert.jpg",width: 200,height: 200,),
          ).show();
      }
    },
      Icons.history_edu
    );

   }
 }
