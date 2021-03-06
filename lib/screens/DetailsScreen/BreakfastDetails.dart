import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_foodapp/Delegates/RecipeModel.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class BreakfastDetails extends StatefulWidget {

  final BreakfastModel breakfast;
  BreakfastDetails({
    @required this.breakfast,
  });
  

  @override
  _BreakfastDetailsState createState() => _BreakfastDetailsState();
}

class _BreakfastDetailsState extends State<BreakfastDetails> {
  bool loved = false;

  bool saved = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SlidingUpPanel(
        parallaxEnabled: true,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12,
        ),
        minHeight: (size.height / 2),
        maxHeight: size.height / 1.2,
        panel: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                widget.breakfast.title,
                style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.timer,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Text(
                    widget.breakfast.cookingTime ,
                    style: TextStyle(color: Colors.black),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 2,
                    height: 30,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.breakfast.servings.toString() + ' Servings',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                color: Colors.black.withOpacity(0.3),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.red,
                        tabs: [
                          Tab(
                            text: "Ingredients".toUpperCase(),
                          ),
                          Tab(
                            text: "Preparation".toUpperCase(),
                          ),
                        ],
                        labelColor: Colors.black,
                        indicator: DotIndicator(
                          color: Colors.black,
                          distanceFromCenter: 16,
                          radius: 3,
                          paintingStyle: PaintingStyle.fill,
                        ),
                        unselectedLabelColor: Colors.black.withOpacity(0.3),
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        labelPadding: EdgeInsets.symmetric(
                          horizontal: 32,
                        ),
                      ),
                      Divider(
                        color: Colors.black.withOpacity(0.3),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Ingredients(breakfast: widget.breakfast),
                            Preparation(breakfast: widget.breakfast),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: widget.breakfast.imgPath,
                    child: ClipRRect(
                      child: Image(
                        width: double.infinity,
                        height: (size.height / 2) + 50,
                        fit: BoxFit.cover,
                        image: AssetImage(widget.breakfast.imgPath),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                right: 20,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      saved = !saved;
                    });
                  },
                child: Icon(
                  saved
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color:  saved ? Colors.red : Colors.white,
                  size: 36,
                ),
              ),
              ),
              Positioned(
                top: 40,
                left: 20,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    CupertinoIcons.back,
                    color: Colors.white,
                    size: 38,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Preparation extends StatelessWidget {
  const Preparation({
    Key key,
    @required this.breakfast,
}) : super(key: key);

  final BreakfastModel breakfast;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: breakfast.preparation.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Text(breakfast.preparation[index],
                    style: TextStyle(color: Colors.black, fontSize: 16),),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.black.withOpacity(0.3));
              },
            ),
          ],
        ),
      ),
    );
  }}

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key key,
    @required this.breakfast,
  }) : super(key: key);

  final BreakfastModel breakfast;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: breakfast.ingredients.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2.0,
                  ),
                  child: Text('??????   ' + breakfast.ingredients[index],
                      style: TextStyle(color: Colors.black, fontSize: 16),),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(color: Colors.black.withOpacity(0.3));
              },
            ),
          ],
        ),
      ),
    );
  }
}