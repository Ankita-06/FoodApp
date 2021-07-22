import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_foodapp/provider/theme_provider.dart';
import 'package:flutter_foodapp/screens/SplashScreen.dart';
import 'package:provider/provider.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(
        builder: (context, ThemeNotifier notifier, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: notifier.darkTheme ? dark : light,
            home: SplashScreen(),
            //onGenerateRoute: (settings) => generateRoute(settings),
          );
        },
      ),
    );

  }
}

