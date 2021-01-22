import 'package:flutter/material.dart';
import 'package:tour_place_app/views/home_view.dart';
import 'package:tour_place_app/views/collection_view.dart';
import 'package:tour_place_app/views/details_view.dart';
import 'package:tour_place_app/views/unknown_view.dart';
import 'package:tour_place_app/constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => HomeView());
    case CollectionViewRoute:
      return MaterialPageRoute(builder: (context) => CollectionView());
    case DetailsViewRoute:
      return MaterialPageRoute(builder: (context) => DetailsView(place: settings.arguments));
    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}
