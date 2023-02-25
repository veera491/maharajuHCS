import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'new_account.dart';


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
                    Uri.parse('http://192.168.0.123:5000/api'),
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

                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => Scaffold(
                            appBar: AppBar(
                              title: Image.asset('assets/images/logo.png',height: 50,width: 300,
                              alignment: Alignment.centerLeft),
                          backgroundColor: Colors.indigo.shade900,
                        ),
                            body: Center(
                              child: Text('You Are LoggedIn !! with $username and $password',
                                style: const TextStyle(
                                color: Colors.indigo,fontSize: 24
                            ),
                          ),
                        ),)));

                      http.Response response = await http.post(
                        //http://jsonplaceholder.typicode.com/posts
                        Uri.parse('http://192.168.0.123:5000/api'),
                        headers: {"Content-Type": "application/json"},
                        body: json.encode({
                          "username":username,
                          "password":password
                        }),
                      );
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

