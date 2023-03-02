import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';

class otherServices extends StatefulWidget {
  const otherServices({Key? key}) : super(key: key);

  @override
  State<otherServices> createState() => _otherServicesState();
}

class _otherServicesState extends State<otherServices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Image.asset('assets/images/logo.png',height: 50,width: 300,
            alignment: Alignment.centerLeft), backgroundColor: Colors.indigo.shade900),
        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 8.0,
            children: [
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
                    width: 250,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                        child: Image.asset('assets/images/pack1.png')
                    ),
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
                    width: 250,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                        child: Image.asset('assets/images/pack2.png')
                    ),
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
                    width: 250,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                        child: Image.asset('assets/images/pack3.png')
                    ),
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
                    width: 250,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                        child: Image.asset('assets/images/pack4.png')
                    ),
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
                    width: 250,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                        child: Image.asset('assets/images/pack5.png')
                    ),
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
                    width: 250,
                    height: 100,
                    padding: const EdgeInsets.all(16),
                    child: Center(
                        child: Image.asset('assets/images/pack6.png')
                    ),
                  ),
                ),
              ),
            ]
        ));
  }
}
