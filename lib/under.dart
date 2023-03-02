import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class under extends StatefulWidget {
  const under({Key? key}) : super(key: key);

  @override
  State<under> createState() => _underState();
}

class _underState extends State<under> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Under Maintenance'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.grey[300],
          child: const Center(child: Text("This Page is Under Maintenance",textDirection: TextDirection.ltr,)),
        )
    );
  }
}