import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';
import 'package:http/http.dart' as http;


//List<Widget> lst = [];

class doc extends StatefulWidget {
  const doc({Key? key}) : super(key: key);

  @override
  State<doc> createState() => _docState();
}

class _docState extends State<doc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          width: 300,
          alignment: Alignment.centerLeft,
        ),
        backgroundColor: Colors.indigo.shade900,
      ),
      body: FutureBuilder<List<Widget>>(
        future: doclist(context),
        builder: (BuildContext context, AsyncSnapshot<List<Widget>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); //Don't Make It Const
          } else if (snapshot.hasError) {
            return Center(
              child: Card(
                color: Colors.indigo.shade300,
                elevation: 10,
                child: Center(child: Text('Sorry for the Inconveniences\nA Error Was Occurred: ${snapshot.error}')),
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: snapshot.data!,
                ),
              ),
            );
          }
        },
      ),
    );
  }


Future<List<Widget>> doclist(context) async {
  var permission = await Geolocator.requestPermission();
  var position = await Geolocator.getCurrentPosition();
  http.Response response = await http.post(
    //http://jsonplaceholder.typicode.com/posts
    Uri.parse('http://192.168.0.115:5000/doc'),
    headers: {"Content-Type": "application/json"},
    body: json.encode({
      "latitude":position.latitude,
      "longitude":position.longitude
    }),
  );
  var data = json.decode(response.body);
  List<Widget> lst1 = [
    const Text("\nLet's Consult A Doctor",style: TextStyle(
      fontSize: 24,
      fontStyle: FontStyle.italic,
      color: Colors.black,
    ),),

    const Text("\nWe always care for you \n",style: TextStyle(
      fontSize: 14,
      fontStyle: FontStyle.italic,
      color: Colors.black38,
    ),),

    const Text("\nWe had the best doctor for you \n",style: TextStyle(
      fontSize: 20,
      fontStyle: FontStyle.italic,
      color: Colors.black,
    ),),
  ];
  for(var i in data){
    lst1.add(
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
                    Image.network(i['Photo'],width: 100,height: 100,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(i['Name'],style: const TextStyle(
                            fontSize: 24,
                            color: Colors.black,
                          ),),
                        ),

                        Center(
                            child: Text(i['Title'],style: const TextStyle(
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
  return lst1;
}}
