import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';
import 'blog_detailer.dart';
import 'package:http/http.dart' as http;

import 'carder.dart';

class doc extends StatefulWidget {
  const doc({Key? key}) : super(key: key);

  @override
  State<doc> createState() => _docState();
}

class _docState extends State<doc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/images/logo.png',height: 50,width: 300,
          alignment: Alignment.centerLeft), backgroundColor: Colors.indigo.shade900),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png',
                width: 300,
                height: 100),
            Text("Let's Consult A Doctor",style: TextStyle(
              fontSize: 24,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),),

            Text("\nWe always care for you \n",style: TextStyle(
              fontSize: 14,
              fontStyle: FontStyle.italic,
              color: Colors.black38,
            ),),

            Text("\nWe had the best doctor for you \n",style: TextStyle(
              fontSize: 20,
              fontStyle: FontStyle.italic,
              color: Colors.black,
            ),),
          ]+doclist(
              context),
        ),
      ) ,
    );
  }
}

loc1() async {
  var permission = await Geolocator.requestPermission();
  var position = await Geolocator.getCurrentPosition();
  http.Response response = await http.post(
    //http://jsonplaceholder.typicode.com/posts
    Uri.parse('http://jsonplaceholder.typicode.com/posts'),
    headers: {"Content-Type": "application/json"},
    body: json.encode({
      "latitude":position.latitude,
      "longitude":position.longitude
    }),
  );
  var d1 = json.decode(response.body);
  print(d1);
  return d1.toList();
}

List<Widget> doclist(context) {
  List docList1 = loc1();
  List<Widget> docList = [...docList1];
  List<Widget> lst = [];
  for(var i=0;i<docList.length;i++){
    lst.add(
      GestureDetector(
        onTap: () {
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder:(context) => const under() ));
        },
        child: Card(
          color: Colors.indigo.shade300,
          child: Container(
              width: 300,
              height: 100,
              padding: const EdgeInsets.all(16),
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/veera.jpg'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text('Dr.Veera Sutapalli',style: TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),),
                        ),

                        Center(
                            child: Text('Mbbs,M.S. - Cardiology',style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),)
                        ),
                      ],
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
  return lst;
}