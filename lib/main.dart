import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'splash_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maharaju/userProfile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'new_account.dart';


void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(), /* const MyApp(), */
        routes: {
          //' /begin':(context) => const MyApp(),
          '/logIn':(context) => const logIn(),
          '/HomePage':(context) => const HomePage(),
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

      body: logIn(),
      //resizeToAvoidBottomInset: false,
    );
  }
}


class logIn extends StatefulWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {

  String username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image.asset('assets/images/login.png',
                  height: 100, width: 200
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60, bottom: 30,top: 20),
              child: TextField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'User Name',
                    hintText: 'Enter your valid Mail Id'
                ),
                onChanged: (value) => username=value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60,bottom: 10),
              child: TextField(
                obscureText: true,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your secure Password'
                ),
                onChanged: (value) => password=value,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60,bottom: 10),
              child: TextButton(
                onPressed: () async {

                  showDialog(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text("Alert"),
                      content: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Icon(Icons.mail_outline_rounded), Text(' A Mail with Password reset\n link was sent to your Email')
                        ],
                      ),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(ctx).pop();
                          },
                          child: Container(
                            color: Colors.indigo.shade900,
                            padding: const EdgeInsets.all(14),
                            //decoration: BoxDecoration(color: Colors.indigo.shade900, borderRadius: const BorderRadius.all(Radius.circular(32.0))),
                            child: const Text("okay",style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  );

                  http.Response response = await http.post(
                    //http://jsonplaceholder.typicode.com/posts
                    Uri.parse('http://127.0.0.1:5000/api'),
                    headers: {"Content-Type": "application/json"},
                    body: json.encode({
                      "Message": "User Wants a new mail"
                    }),
                  );
                  print(json.decode(response.body));
                },

                child: const Text(
                  'Forgot Password',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60,bottom: 10,top: 20),
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Colors.indigo.shade900, borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () async {

                    if(username==""||password==""){
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Alert"),
                          content: const Text("Please Enter Username and Password"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                color: Colors.indigo.shade900,
                                padding: const EdgeInsets.all(14),
                                //decoration: BoxDecoration(color: Colors.indigo.shade900, borderRadius: const BorderRadius.all(Radius.circular(32.0))),
                                child: const Text("okay",style: TextStyle(color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      );
                    }else{

                      http.Response response = await http.post(
                        //http://jsonplaceholder.typicode.com/posts
                        Uri.parse('http://ec2-54-206-33-26.ap-southeast-2.compute.amazonaws.com/userlogin'),
                        //headers: {"Content-Type": "application/json"},
                        body: {
                          "UserName":username,
                          "PassWord":password
                        },
                      );

                      var user_details= json.decode(response.body);
                      if(user_details['Patient Id'] != null) {
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setString('username', username);
                        await prefs.setInt('Patient Id', user_details['Patient Id']);
                        await prefs.setString('user_details',response.body);
                        Navigator.push(context, MaterialPageRoute(
                            builder: (_) =>
                                main_screen())); //user(user_details: json.decode(response.body))
                      }else{
                        showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text("Alert"),
                            content: const Text("Please Enter a Valid Username and Password"),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(ctx).pop();
                                },
                                child: Container(
                                  color: Colors.indigo.shade900,
                                  padding: const EdgeInsets.all(14),
                                  //decoration: BoxDecoration(color: Colors.indigo.shade900, borderRadius: const BorderRadius.all(Radius.circular(32.0))),
                                  child: const Text("okay",style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 60, right: 60,bottom: 10,top: 30),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const newAccount()),
                  );
                },
                child: const Text(
                  'New User? Create Account',
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            )
          ],
        ),
      ),),
    );
  }
}


class main_screen extends StatefulWidget {
  const main_screen({Key? key}) : super(key: key);

  @override
  State<main_screen> createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
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

  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    user(),
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

