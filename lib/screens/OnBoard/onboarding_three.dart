import 'package:flutter/material.dart';

//import package named 'parallax swiper' from pub.DeviceOrientation
import 'package:parallax_swiper/parallax_swiper.dart';

import '../Home/HomePage.dart';

//same thing, copy the example
//change the images first
//seem like need to change alot of things
//this package is parallax swiper, i found it at pub.dev
//and make this become an introduction/onboarding screen
class OnBoardingThree extends StatefulWidget {
  const OnBoardingThree({Key key}) : super(key: key);

  @override
  _OnBoardingThreeState createState() => _OnBoardingThreeState();
}

class _OnBoardingThreeState extends State<OnBoardingThree> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    //remove the background image
    //change the screen size
    //this bg container is the background widget
    var bg = Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      //now add a button to redirect to home page
      //this flatbutton must put in this background widget, it will not working if put in foreground widget
      child: currentPage == 4
          ? Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 30),
            width: 200,
            decoration: BoxDecoration(
              color: Color(0xFFBA68C8),
              borderRadius: BorderRadius.circular(30),
            ),
            //make this button show up only at last page
            child: TextButton(
              child: Text(
                'Home',
                style:
                TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => HomePage()),
                );
              },
            ),
          ),
        ],
      )
          : null,
    );

//now, edit screen to become introduction screen
    var screen1 = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/onboard2.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Discover Recipes',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 80,
            child: Text(
              'Search for traditional and continetal recipes.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Spacer(),
                Text('Swipe'),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 32,
                ),
                Spacer(),
                Text('1/5'),
              ],
            ),
          ),
        ],
      ),
    );

    var screen2 = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/onboard3.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Favourite',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 80,
            child: Text(
              'Save your favourite recipes.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 32,
                ),
                Spacer(),
                Text('Swipe'),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 32,
                ),
                Spacer(),
                Text('2/5'),
              ],
            ),
          ),
        ],
      ),
    );

    var screen3 = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/onboard1.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Customize your dish',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 80,
            child: Text(
              'Customize your dish using the ingredients that are in your kitchen.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 32,
                ),
                Spacer(),
                Text('Swipe'),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 32,
                ),
                Spacer(),
                Text('3/5'),
              ],
            ),
          ),
        ],
      ),
    );

    var screen4 = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/onboard4.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Quick and Easy',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 80,
            child: Text(
              'Get the latest quickest and easiest home recipes.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 32,
                ),
                Spacer(),
                Text('Swipe'),
                Spacer(),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 32,
                ),
                Spacer(),
                Text('4/5'),
              ],
            ),
          ),
        ],
      ),
    );

    var screen5 = Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            'assets/images/onboard5.png',
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.55,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Happy Cooking...',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 80,
            child: Text(
              'Learn to cook delicious meals right now.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              //last screen should not have swipe arrow
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('5/5'),
              ],
            ),
          ),
        ],
      ),
    );

//create a list
    List<Widget> screens = [screen1, screen2, screen3, screen4, screen5];
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: ParallaxSwiper(
          backgroundWidget: bg,
          foregroundWidgets: screens,
          swipeDirection: Axis.horizontal,
          swiperCurve: Curves.bounceOut,
          returnCurve: Curves.bounceOut,
          swiperInfiniteSwipe: false, //prevent infinite swipe
          swiperInitialPage: 0,
          onItemChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
        ),
      ),
    );
  }
}