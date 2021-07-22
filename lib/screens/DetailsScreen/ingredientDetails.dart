import 'package:flutter/material.dart';
import 'package:flutter_foodapp/screens/ListScreen/BreakfastList.dart';


class IngredientDetails extends StatefulWidget {
  @override
  _IngredientDetails createState() => _IngredientDetails();
}

class _IngredientDetails extends State<IngredientDetails> {
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
                            onTap: (){},
                            child:  CircleAvatar(
                              radius: 45.0,
                              backgroundImage: ExactAssetImage('assets/images/mushroom.png'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Container(
                            height: 10.0,
                          ),
                          Text(
                            'Mushroom',
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
                              backgroundImage: ExactAssetImage('assets/images/paneer.png'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Container(
                            height: 10.0,
                          ),
                          Text(
                            'Paneer',
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
                              backgroundImage: ExactAssetImage('assets/images/bread.png'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Container(
                            height: 10.0,
                          ),
                          Text(
                            'Bread',
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
                              backgroundImage: ExactAssetImage('assets/images/rice.png'),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          Container(
                            height: 10.0,
                          ),
                          Text(
                            'Rice',
                            style: TextStyle(fontSize: 20),
                          )
                        ],
                      ),
                      
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}
