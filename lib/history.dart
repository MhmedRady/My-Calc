import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/Consts.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'Home.dart';

void main() {
  runApp(HistoryClass());
}

class HistoryClass extends StatefulWidget {
  @override
  _HistoryClassState createState() => _HistoryClassState();
}

class _HistoryClassState extends State<HistoryClass> {

  var list = setResults;

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
        backgroundColor: Color(0xFF252525),
      appBar: AppBar(
        backgroundColor: Color(0xFF2e3440),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("History",
              style: MyChanges().myTextStyle(20, 0xFFFfFFFF),)
          ],
        ),

        centerTitle: true,

        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.delete),

            onPressed: () {
              Alert(
                context: context,
                type: AlertType.warning,
                title: "Empty My History",
                desc: "Are You Sure To Empty Your History ?!.",
                buttons: [
                  DialogButton(
                    child: Text(
                      "Empty History",
                      style: MyChanges().myTextStyle(20, 0xFFFfFFFF),
                    ),
                    onPressed:(){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => CalcApp()));
                      setResults.clear();
                    },
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromRGBO(25,22,22,1),
                          Color.fromRGBO(49,49,49,1),
                          Color.fromRGBO(24,24,24,1)
                          // Color(0xFF0494b1),
                          // Color(0xFF0055a3),
                          // Color(0xFF59a19f)
                        ]),
                  ),
                ],
              ).show();
            },
          )
        ],

      ),
      body: Container(
        decoration:
        MyChanges().myBodyBackG(),
        child: ListView.separated(

          itemCount: setResults.length,

          itemBuilder: (context, index) {
            return
              // ListTile(key: new Key(index.toString()));
              Container(

                padding: EdgeInsets.all(16.0),
                child: Text(setResults[index] ,style: MyChanges().myTextStyle(20,0xFFFFFFFF),),
              );
          },
          separatorBuilder: (context, index) {
            return Divider(color: Colors.white60);
          },

        ),
      ),

    );

  }
}

