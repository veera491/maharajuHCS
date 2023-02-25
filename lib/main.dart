import 'package:flutter/material.dart';
import 'myProfile.dart';

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const MyApp(),
        routes: {
          '/logIn':(context) => const logIn(),
        },
      )
  );
}



class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/images/logo.png',height: 50,width: 300,
          alignment: Alignment.centerLeft),
        backgroundColor: Colors.indigo.shade900,
      ),

      body: MyNavigationBar(),
      resizeToAvoidBottomInset: false,
    );
  }
}

class MyNavigationBar extends StatefulWidget {
  MyNavigationBar ({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar > {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    logIn(),
    Text('myHealth', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('myOrders', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container( padding: const EdgeInsets.only(bottom: 15,left: 40, right: 40),
      child: ClipRRect(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(200), topRight: Radius.circular(200), bottomLeft:  Radius.circular(200), bottomRight:  Radius.circular(200)),

      child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.home_rounded),
                label: 'Home',
                backgroundColor: Colors.indigo.shade300,
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.person),
                label: 'myProfile',
                backgroundColor: Colors.indigo.shade300,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.medical_information_rounded),
              label: 'myHealth',
              backgroundColor: Colors.indigo.shade300,
            ),
            BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_rounded),
                label: 'myOrders',
                backgroundColor: Colors.indigo.shade300,
            ),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.indigo.shade900,
          iconSize: 28,
          onTap: _onItemTapped,
          elevation: 5
      ),
      ),
      ),
    );
  }
}

