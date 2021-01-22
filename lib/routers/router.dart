import 'package:flutter/material.dart';
import 'package:tour_place_app/views/collection_view.dart';
import 'package:tour_place_app/views/collection_view.dart';
import 'package:tour_place_app/views/collection_view.dart';
import 'package:tour_place_app/views/unknown_view.dart';
import 'package:tour_place_app/constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => UnknownView());
    case CollectionViewRoute:
      return MaterialPageRoute(builder: (context) => UnknownView());
    case DetailsViewRoute:
      return MaterialPageRoute(builder: (context) => UnknownView());
    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}
