import 'package:flutter/material.dart';
import 'package:tour_place_app/constants.dart';
import 'package:tour_place_app/routers/router.dart';
import 'package:tour_place_app/views/home_view.dart';
import 'package:tour_place_app/views/details_view.dart';
import 'package:tour_place_app/views/collection_view.dart';

void main() => (runApp(TourApp()));

class TourApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour Place App',
      onGenerateRoute: generateRoute,
      initialRoute: HomeViewRoute,
      // home: HomeView(),
      // theme: ThemeData.light(),
      theme: ThemeData(
        brightness: Brightness.dark,
        // accentColorBrightness: Bright,
        primarySwatch: Colors.red,
        backgroundColor: Colors.orangeAccent,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}