import 'package:flutter/material.dart';
import '../Home/HomePage.dart';
import 'onboarding_content.dart';
//create a stateful widget

class OnBoardingFour extends StatefulWidget {
  OnBoardingFour({Key key}) : super(key: key);

  @override
  _OnBoardingFourState createState() => _OnBoardingFourState();
}

class _OnBoardingFourState extends State<OnBoardingFour> {
  //in this onboarding, using page view builder to render all screens

  int currentPage = 0;
  List<Map<String, dynamic>> contentData = [
    {
      "title": "Discover Recipes",
      "text":
      "Search for traditional and continetal recipes.",
      "image": "assets/images/onboard2.png",
    },
    {
      "title": "Favourite",
      "text":
      "Save your favourite recipes.",
      "image": "assets/images/onboard3.png",
    },
    {
      "title": "Customize your dish",
      "text":
      "Customize your dish using the ingredients that are in your kitchen.",
      "image": "assets/images/onboard1.png",
    },
    {
      "title": "Quick and Easy",
      "text":
      "Get the latest quickest and easiest home recipes.",
      "image": "assets/images/onboard4.png",
    },
    {
      "title": "Happy Cooking...",
      "text":
      "Learn to cook delicious meals right now.",
      "image": "assets/images/onboard5.png",
    },
  ];
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController(); //for screen control
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _controller,
                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: contentData.length,
                //here we need a widget to render content
                itemBuilder: (context, index) => OnBoardingContent(
                    text: contentData[index]['text'],
                    image: contentData[index]['image'],
                    title: contentData[index]['title']),
              ),
            ), //for images display
            Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Spacer(),
                      Row(
                        children: [
                          Spacer(
                            flex: 2,
                          ),
                          Row(
                            children: List.generate(contentData.length,
                                    (index) => buildDot(index: index)),
                          ), //create dot progress
                          Spacer(),
                          Container(
                            child: currentPage == 4
                                ? TextButton(
                              child: Text('Done'),
                              onPressed: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (_) => HomePage()),
                                );
                              },
                            )
                                : TextButton(
                              child: Text('Skip'),
                              onPressed: () {
                                setState(() {
                                  _controller.jumpToPage(4);
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )), //for progress dots and icon
          ],
        ),
      ),
    );
  }

  //this dot progress is referred/inspired from 'The Flutter Way' on YouTube
//please refer to his channel and video https://www.youtube.com/watch?v=YEJPg2jwzI8
  AnimatedContainer buildDot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Color(0xFFBA68C8) : Colors.grey[400],
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}