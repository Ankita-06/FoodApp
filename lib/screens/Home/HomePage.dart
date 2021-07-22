import 'package:flutter/material.dart';
import 'package:flutter_foodapp/Delegates/sliver_persistent_header_delegate_impl.dart';
import 'package:flutter_foodapp/Model/SliverAppBar.dart';
import 'package:flutter_foodapp/provider/theme_provider.dart';
import 'package:flutter_foodapp/screens/DetailsScreen/ingredientDetails.dart';
import 'package:provider/provider.dart';
import 'package:tuple/tuple.dart';

import '../DetailsScreen/categoryDetails.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  final List<Tuple3> _pages = [
    Tuple3('Meals', CategoryDetails(), Icon(Icons.fastfood_rounded),),
    Tuple3('Ingredients', IngredientDetails(), Icon(Icons.food_bank_rounded)),
    //Tuple3('Dish Type', CategoryDetails(), Icon(Icons.fastfood_rounded),),
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _pages.length, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                ),
                child: Text(
                  'foodie moodie',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
              ),
              Consumer<ThemeNotifier>(
                builder:(context, notifier, child) =>
                    SwitchListTile(
                      title: Text("Dark Mode"),
                      onChanged:(value){
                        notifier.toggleTheme();
                      } ,
                      value: notifier.darkTheme ,
                    ),
              ),
              ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Account'),
                  subtitle: Text('Logged in')
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ]
        ),
      ),

      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            HomeSliverAppBar(_pages[_tabController.index].item1),
            SliverPersistentHeader(
              delegate: SliverPersistentHeaderDelegateImpl(
                tabBar: TabBar(
                  labelColor: Colors.grey,
                  labelStyle: TextStyle(fontSize: 18),
                  indicatorColor: Colors.black,
                  controller: _tabController,
                  tabs: _pages
                      .map<Tab>((Tuple3 page) => Tab(text: page.item1))
                      .toList(),
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: _pages.map<Widget>((Tuple3 page) => page.item2).toList(),
        ),
      ),
    );
  }
}