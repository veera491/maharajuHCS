import 'package:card_slider/card_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maharaju/popular_offerings.dart';
import 'package:maharaju/specialist.dart';
import 'package:maharaju/under.dart';

import 'covid_services.dart';
import 'other_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder:(context) => const popular() )
                );
              },
              child: Card(
                color: Colors.indigo.shade300,
                child: Container(
                  width: 250,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text("Popular Offerings",style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder:(context) => const covid() )
                );
              },
              child: Card(
                color: Colors.indigo.shade300,
                child: Container(
                  width: 250,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text("Covid Services",style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder:(context) => const special() )
                );
              },
              child: Card(
                color: Colors.indigo.shade300,
                child: Container(
                  width: 250,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text("Specialist Services",style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(
                        builder:(context) => const otherServices() )
                );
              },
              child: Card(
                color: Colors.indigo.shade300,
                child: Container(
                  width: 250,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: Center(
                    child: Text("Other Services",style: TextStyle(
                        color: Colors.indigo.shade900,
                        fontSize: 24,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}

