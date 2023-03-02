import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';

import 'doctor_slot.dart';

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
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder:(context) => const docSlot() )
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
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder:(context) => const under() )
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
                            child: Text('Dr.Rao',style: TextStyle(
                              fontSize: 24,
                              color: Colors.black,
                            ),),
                          ),

                          Center(
                              child: Text('Mbbs,M.S. - neurology',style: TextStyle(
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
              Navigator.of(context).push(
                  MaterialPageRoute(
                      builder:(context) => const under() )
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
                              child: Text('Mbbs,M.S. - ENT',style: TextStyle(
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
