import 'package:flutter/material.dart';
//import introduction screen
import 'package:introduction_screen/introduction_screen.dart';
import '../Home/HomePage.dart';

//now, edit the content to what you want

class OnBoardingOne extends StatefulWidget {
  @override
  _OnBoardingOneState createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  final introKey = GlobalKey<IntroductionScreenState>();

  //this function is to call home page when introduction screen done
  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

//this function is to render images from assets folder
  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/$assetName.png', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    //this is page decoration of background
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Discover Recipes",
          body:
          "Search for traditional and continetal recipes.",
          image: _buildImage('images/onboard2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Favourite",
          body:
          "Save your favourite recipes.",
          image: _buildImage('images/onboard3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Customize your dish",
          body:
          "Customize your dish using the ingredients that are in your kitchen.",
          image: _buildImage('images/onboard1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Quick and Easy",
          body:
          "Get the latest quickest and easiest home recipes.",
          image: _buildImage('images/onboard4'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Happy Cooking...",
          body:
          "Learn to cook delicious meals right now.",
          image: _buildImage('images/onboard5'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context), //call when introduction done
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true, //show skip button, skip to last page
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      //this is dot decoration
      dotsDecorator: DotsDecorator(
        //delete const if want to change active color
        activeColor: Color(0xFFBA68C8),
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}