import 'cards_blog.dart';
import 'package:flutter/material.dart';

class MyClass extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Class'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedCard(
              name: 'John Doe',
              imageUrl: 'https://picsum.photos/id/237/200/300',
            ),
            AnimatedCard(
              name: 'Jane Doe',
              imageUrl: 'https://picsum.photos/id/238/200/300',
            ),
            AnimatedCard(
              name: 'Bob Smith',
              imageUrl: 'https://picsum.photos/id/239/200/300',
            ),

          ],
        ),
      ),
    );
  }
}
