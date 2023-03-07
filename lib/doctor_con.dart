import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'blog_detailer.dart';
import 'doctor_slot.dart';

class doc extends StatefulWidget {
  const doc({Key? key}) : super(key: key);

  @override
  State<doc> createState() => _docState();
}

class _docState extends State<doc> {
  @override
  Widget build(BuildContext context) {
    var c = loc();
    return Scaffold(
      appBar: AppBar(title: Image.asset('assets/images/logo.png',height: 50,width: 300,
        alignment: Alignment.centerLeft), backgroundColor: Colors.indigo.shade900),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Let's Consult A Doctor",style: TextStyle(
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

          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(
              //         builder:(context) => const docSlot() )
              // );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorProfilePage(
                    name: 'Dr. Madhu Sudhan Reddy',
                    photoUrl: 'assets/images/madhu.jpg',
                    speciality: 'Cardiologist',
                    bio:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula rhoncus odio, id ultricies velit tincidunt vel. Cras nec felis finibus, consequat leo at, dapibus sem. Duis sit amet augue magna. Praesent in magna ac enim faucibus efficitur. Integer vulputate est vel mi imperdiet euismod. Sed sollicitudin sapien sit amet felis dapibus, ac pellentesque ipsum hendrerit. In viverra euismod metus, eget maximus lorem dictum vitae.'
                ),
                ),
              );

            },
            child: Card(
              color: Colors.indigo.shade300,
              child: Container(
                width: 300,
                height: 100,
                padding: const EdgeInsets.all(16),
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
                )
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
              // Navigator.of(context).push(
              //     MaterialPageRoute(
              //         builder:(context) => const under() )
              // );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorProfilePage(
                    name: 'Dr. Madhu Sudhan Reddy',
                    photoUrl: 'assets/images/madhu.jpg',
                    speciality: 'Nuerology',
                    bio:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula rhoncus odio, id ultricies velit tincidunt vel. Cras nec felis finibus, consequat leo at, dapibus sem. Duis sit amet augue magna. Praesent in magna ac enim faucibus efficitur. Integer vulputate est vel mi imperdiet euismod. Sed sollicitudin sapien sit amet felis dapibus, ac pellentesque ipsum hendrerit. In viverra euismod metus, eget maximus lorem dictum vitae.'
                ),
                ),
              );
            },
            child: Card(
              color: Colors.indigo.shade300,
              child: Container(
                  width: 300,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset('assets/images/person.png'),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text('Dr. Madhu',style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),),
                          ),

                          Center(
                              child: Text('MBBS,M.S. - Neurology',style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),)
                          ),

                        ],
                      )

                    ],
                  )
              ),
            ),
          ),

          GestureDetector(
            onTap: () {
            //   Navigator.of(context).push(
            //       MaterialPageRoute(
            //           builder:(context) => const under() )
            //   );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DoctorProfilePage(
                  name: 'Dr. Madhu Sudhan Reddy',
                  photoUrl: 'assets/images/madhu.jpg',
                  speciality: 'ENT Expert',
                  bio:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula rhoncus odio, id ultricies velit tincidunt vel. Cras nec felis finibus, consequat leo at, dapibus sem. Duis sit amet augue magna. Praesent in magna ac enim faucibus efficitur. Integer vulputate est vel mi imperdiet euismod. Sed sollicitudin sapien sit amet felis dapibus, ac pellentesque ipsum hendrerit. In viverra euismod metus, eget maximus lorem dictum vitae.'
                ),
                ),
              );
            },
            child: Card(
              color: Colors.indigo.shade300,
              child: Container(
                  width: 300,
                  height: 100,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      Image.asset('assets/images/person.png'),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Center(
                            child: Text('Dr.Prasad',style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),),
                          ),

                          Center(
                              child: Text('MBBS,M.S. - ENT',style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),)
                          ),

                        ],
                      )

                    ],
                  )
              ),
            ),
          ),

        ],
      ),
    ) ,
    );
  }
}

loc() async {
  //var permission = await Geolocator.requestPermission();
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