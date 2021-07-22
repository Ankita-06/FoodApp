import 'package:flutter/material.dart';
import 'package:flutter_foodapp/screens/Home/HeaderScreen.dart';

class HomeSliverAppBar extends StatelessWidget {
  final String _title;

  const HomeSliverAppBar(
      this._title, {
        Key key,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      //backgroundColor: Colors.deepOrangeAccent,
      flexibleSpace: FlexibleSpaceBar(background: HeaderScreen()),
      expandedHeight: MediaQuery.of(context).size.height * 0.35,
      stretch: true,
      title: Text(''),
      elevation: 12,
      centerTitle: true,
      pinned: true,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () => Scaffold.of(context).openDrawer(),
      ),
      actions: [
        Icon(Icons.favorite_outline, size: 28),
        SizedBox(width: 12),
      ],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40)),

      ),
    );
  }
}
