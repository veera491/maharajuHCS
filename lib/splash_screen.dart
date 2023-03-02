import 'dart:async';
import 'package:flutter/src/material/page.dart';
import 'package:flutter/material.dart';
import 'main.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      // Navigation code here
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyApp()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          height: 150.0,
          width: 150.0,
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
//
// class SplashScreen extends StatefulWidget {
//   @override
//   _MySplashScreenState createState() => _MySplashScreenState();
// }
//
// class _MySplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Simulate some initialization process
//     Future.delayed(Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MyHomePage()),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Stack(
//         children: [
//           AnimatedContainer(
//             duration: Duration(seconds: 2),
//             color: Colors.blue,
//             curve: Curves.easeInOut,
//             child: Center(
//               child: AnimatedOpacity(
//                 duration: Duration(seconds: 2),
//                 opacity: 1.0,
//                 curve: Curves.easeInOut,
//                 child: Image.asset(
//                   'assets/images/logo.png',
//                   width: 150.0,
//                   height: 150.0,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//       ),
//       body: Center(
//         child: Text('Welcome to my app!'),
//       ),
//     );
//   }
// }