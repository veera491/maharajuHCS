import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maharaju/under.dart';
import 'carder.dart';
import 'package:http/http.dart' as http;
import 'doctor_con.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var c = loc();
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
             Text("\nPopular Offerings",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.indigo.shade900
            ),),
            card_scroller(context,[
              'assets/images/pop1.png',
              'assets/images/pop2.png',
              'assets/images/pop3.png',
              'assets/images/pop4.png',
              'assets/images/pop5.png',
              'assets/images/pop6.png'
            ],[doc(),under(),under(),under(),under(),under()]),

            Text("\nCovid Services",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade900
            ),),
            card_scroller(context,[
              'assets/images/cov1.png',
              'assets/images/cov2.png',
              'assets/images/cov3.png',
              'assets/images/cov4.png',
              'assets/images/cov5.png',
              'assets/images/cov6.png'
            ],[under(),under(),under(),under(),under(),under()]),

            Text("\nSpecialist Services",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade900
            ),),
            card_scroller(context,[
              'assets/images/dis1.png',
              'assets/images/dis2.png',
              'assets/images/dis3.png',
              'assets/images/dis4.png',
              'assets/images/dis5.png',
              'assets/images/dis6.png'
            ],[under(),under(),under(),under(),under(),under()]),
          ],
        )
      )
    );
  }
}

loc() async {
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
  print(json.decode(response.body));
}