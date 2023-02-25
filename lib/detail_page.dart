import 'card_data.dart';
import 'package:flutter/material.dart';

//detail page of the image

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //calls the function to move to next image
  void buildNextImage() {
    setState(() {
      CardData().nextImage();
    });
  }

  //calls the function to move to previous image
  void buildPreviousImage() {
    setState(() {
      CardData().previousImage();
    });
  }

  //calls the function to move to build dot indicator in this widget
  Widget rebuildDotIndicator() {
    return CardData().buildDotsIndicator();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(title: Image.asset('assets/images/logo.png',height: 50,width: 300,
          alignment: Alignment.centerLeft), backgroundColor: Colors.indigo.shade900),

      //The gesture detector widget will detect swipes and taps of the image card
      body: GestureDetector(
        onHorizontalDragEnd: (dragEndDetails) {
          setState(() {
            if (dragEndDetails.primaryVelocity! < 0) {
              // Page forwards
              buildNextImage();
            } else if (dragEndDetails.primaryVelocity! > 0) {
              // Page backwards
              buildPreviousImage();
            }
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(CardData().cardImageUrl[currentSelected]),
            ),
          ),

          //The stack widget puts the dot indicator on the image card
          child: Stack(
            children: [
              Positioned(
                //Positions the dot indicator at the bottom of the card
                right: 0,
                left: 0,
                bottom: 10,
                child: rebuildDotIndicator(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}