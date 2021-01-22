import 'package:flutter/material.dart';
import 'package:tour_place_app/constants.dart';
import 'package:tour_place_app/routers/router.dart';
import 'package:tour_place_app/views/home_view.dart';
import 'package:tour_place_app/views/details_view.dart';
import 'package:tour_place_app/views/collection_view.dart';

void main() => (runApp(MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour Place App',
      onGenerateRoute: generateRoute,
      initialRoute: HomeViewRoute,
      theme: ThemeData.dark(),
      // home: HomeView(),
      // theme: ThemeData(
      //   // This is the theme of your application.
      //   //
      //   // Try running your application with "flutter run". You'll see the
      //   // application has a blue toolbar. Then, without quitting the app, try
      //   // changing the primarySwatch below to Colors.green and then invoke
      //   // "hot reload" (press "r" in the console where you ran "flutter run",
      //   // or simply save your changes to "hot reload" in a Flutter IDE).
      //   // Notice that the counter didn't reset back to zero; the application
      //   // is not restarted.
      //   primarySwatch: Colors.red,
      //   // This makes the visual density adapt to the platform that you run
      //   // the app on. For desktop platforms, the controls will be smaller and
      //   // closer together (more dense) than on mobile platforms.
      //   visualDensity: VisualDensity.adaptivePlatformDensity,
      // ),
      // home: DetailsView(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}