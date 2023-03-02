import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maharaju/under.dart';

class special extends StatefulWidget {
  const special({Key? key}) : super(key: key);

  @override
  State<special> createState() => _specialState();
}

class _specialState extends State<special> {
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
                        child: Image.asset('assets/images/dis1.png')
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
                        child: Image.asset('assets/images/dis2.png')
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
                        child: Image.asset('assets/images/dis3.png')
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
                        child: Image.asset('assets/images/dis4.png')
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
                        child: Image.asset('assets/images/dis5.png')
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
                        child: Image.asset('assets/images/dis6.png')
                    ),
                  ),
                ),
              ),
            ]
        ));
  }
}
