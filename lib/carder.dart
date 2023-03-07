import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';

Widget card_scroller(BuildContext context, List<String> mylist, List<dynamic> mylist1){
  List<Widget> lst = [];
  for(var i=0;i<mylist.length;i++){
    lst.add(
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder:(context) => mylist1[i] )
          );
        },
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Card(
            color: Colors.indigo.shade300,
            child: Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(15),
              child: Center(
                  child: Image.asset(mylist[i])
              ),
            ),
          ),
        )
      ),
    );
  }
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: lst,
    ),
  );
}

