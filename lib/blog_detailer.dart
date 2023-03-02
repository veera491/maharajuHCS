import 'package:flutter/material.dart';

class DoctorProfilePage extends StatefulWidget {
  final String name;
  final String photoUrl;
  final String speciality;
  final String bio;

  DoctorProfilePage({
    required this.name,
    required this.photoUrl,
    required this.speciality,
    required this.bio,
    // this.name = "Madhu",
    // this.photoUrl = 'assets/images/person.png',
    // this.speciality = "Surgeon",
    // this.bio = "Honourable Doctor!",

  });

  @override
  _DoctorProfilePageState createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 800),
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeTransition(
              opacity: _animation,
              child: CircleAvatar(
                backgroundImage: NetworkImage(widget.photoUrl),
                radius: 75.0,
              ),
            ),
            SizedBox(height: 20.0),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(-1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                ),
              ),
              child: Text(
                widget.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                ),
              ),
              child: Text(
                widget.speciality,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.0),
            FadeTransition(
              opacity: _animation,
              child: Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  widget.bio,
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (context) => DoctorProfilePage(
// name: 'Dr. John Smith',
// photoUrl: 'https://picsum.photos/200',
// speciality: 'Cardiologist',
// bio:
// 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula rhoncus odio, id ultricies velit tincidunt vel. Cras nec felis finibus, consequat leo at, dapibus sem. Duis sit amet augue magna. Praesent in magna ac enim faucibus efficitur. Integer vulputate est vel mi imperdiet euismod. Sed sollicitudin sapien sit amet felis dapibus, ac pellentesque ipsum hendrerit. In viverra euismod metus, eget maximus lorem dictum vitae.'
// ),
// ),
// );
