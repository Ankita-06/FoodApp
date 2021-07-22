import 'package:flutter/material.dart';
import 'package:flutter_foodapp/screens/ListScreen/BreakfastList.dart';
import 'package:flutter_foodapp/screens/ListScreen/SoupList.dart';


class CategoryDetails extends StatefulWidget {
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => BreakfastList()),
                                    );
                                  },
                                  child:  CircleAvatar(
                                    radius: 45.0,
                                    backgroundImage: ExactAssetImage('assets/images/breakfast.png'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Container(
                                  height: 10.0,
                                ),
                                Text(
                                  'Breakfast',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => SoupList()),
                                    );
                                  },
                                  child:  CircleAvatar(
                                    radius: 45.0,
                                    backgroundImage: ExactAssetImage('assets/images/soup.png'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Container(
                                  height: 10.0,
                                ),
                                Text(
                                  'Soup',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),

                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){},
                                  child:  CircleAvatar(
                                    radius: 45.0,
                                    backgroundImage: ExactAssetImage('assets/images/drinks.png'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Container(
                                  height: 10.0,
                                ),
                                Text(
                                  'Drinks',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),


                          ],
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5, bottom: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: (){},
                                  child:  CircleAvatar(
                                    radius: 45.0,
                                    backgroundImage: ExactAssetImage('assets/images/snacks.png'),
                                    backgroundColor: Colors.transparent,
                                  ),
                                ),
                                Container(
                                  height: 10.0,
                                ),
                                Text(
                                  'Snacks',
                                  style: TextStyle(fontSize: 20),
                                )
                              ],
                            ),],
                        ),
                      ),],
                  ),
                ],
              ),

      ),
    );

  }
}
