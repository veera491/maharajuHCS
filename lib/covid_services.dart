import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';

class covid extends StatefulWidget {
  const covid({Key? key}) : super(key: key);

  @override
  State<covid> createState() => _covidState();
}

class _covidState extends State<covid> {
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
                        child: Image.asset('assets/images/cov1.png')
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
                        child: Image.asset('assets/images/cov2.png')
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
                        child: Image.asset('assets/images/cov3.png')
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
                        child: Image.asset('assets/images/cov4.png')
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
                        child: Image.asset('assets/images/cov5.png')
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
                        child: Image.asset('assets/images/cov6.png')
                    ),
                  ),
                ),
              ),
            ]
        ));
  }
}
