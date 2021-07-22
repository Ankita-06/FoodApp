import 'package:flutter/material.dart';
//import package from fancy_on_boarding
import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import '../Home/HomePage.dart';

//same thing, copy the example and edit later
class OnBoardingTwo extends StatefulWidget {
  OnBoardingTwo({Key key}) : super(key: key);

  @override
  _OnBoardingTwoState createState() => new _OnBoardingTwoState();
}

class _OnBoardingTwoState extends State<OnBoardingTwo> {
  //Create a list of PageModel to be set on the onBoarding Screens.
  //remember to change the images

  final pageList = [
    PageModel(
        color: const Color(0xFF678FB4),
        heroImagePath: 'assets/images/onboard2.png',
        title: Text('Discover Recipes',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 24.0,
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
              'Search for traditional and continetal recipes.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              )),
        ),
        iconImagePath: 'assets/images/onboard2.png'),
    PageModel(
        color: const Color(0xFF65B0B4),
        heroImagePath: 'assets/images/onboard3.png',
        title: Text('Favourite',
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.white,
              fontSize: 24.0,
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Text(
              'Save your favourite recipes.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              )),
        ),
        iconImagePath: 'assets/images/onboard3.png'),
    PageModel(
      color: const Color(0xFF9B90BC),
      heroImagePath: 'assets/images/onboard1.png',
      title: Text('Customize your dish',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 24.0,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
            'Customize your dish using the ingredients that are in your kitchen.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
      ),
      //this icon is show at the bottow, can be an icon or images
    iconImagePath: 'assets/images/onboard1.png'),

    PageModel(
      color: const Color(0xFF678FB4),
      heroImagePath: 'assets/images/onboard4.png',
      title: Text('Quick and Easy',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 24.0,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
            'Get the latest quickest and easiest home recipes.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
      ),
      iconImagePath: 'assets/images/onboard4.png',
    ),
    PageModel(
      color: const Color(0xFF65B0B4),
      heroImagePath: 'assets/images/onboard5.png',
      title: Text('Happy Cooking...',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Colors.white,
            fontSize: 24.0,
          )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
            'Learn to cook delicious meals right now.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            )),
      ),
      iconImagePath: 'assets/images/onboard5.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Pass pageList and the mainPage route.
      body: FancyOnBoarding(
        doneButtonText: "Done",
        skipButtonText: "Skip",
        pageList: pageList,
        //change the route page as well
        onDoneButtonPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage()),
        ),
        onSkipButtonPressed: () => Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage()),
        ),
      ),
    );
  }
}