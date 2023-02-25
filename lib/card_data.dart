import 'package:dots_indicator/dots_indicator.dart';

//this is the indicator for the dot indicator
int currentSelected = 0;

//this class was created to store the image urls and save functions for actions taken in the app
class CardData {
  List<String> cardImageUrl = [
    '/images/pop1.png',
    'assets/images/pop2.png',
    'assets/images/pop3.png',
    'assets/images/pop4.png',
    'assets/images/pop5.png',
    'assets/images/pop6.png',
  ];

  //function to move to next image
  nextImage() {
    if (currentSelected == cardImageUrl.length - 1) {
      currentSelected = 0;
    } else {
      int newlySelected = currentSelected + 1;
      currentSelected = newlySelected;
    }
  }

  //moves to previous image
  previousImage() {
    if (currentSelected == 0) {
      currentSelected = 0;
    } else {
      int newlySelected = currentSelected - 1;
      currentSelected = newlySelected;
    }
  }

  //builds the dot indicator with the dots indicator package
  DotsIndicator buildDotsIndicator() {
    return DotsIndicator(
      dotsCount: cardImageUrl.length,
      position: currentSelected.toDouble(),
    );
  }
}