import 'package:flutter/material.dart';
import 'package:basic_flutter_app/views/list_screen.dart';
import 'package:basic_flutter_app/views/unknown_view.dart';
import 'package:basic_flutter_app/constants.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeViewRoute:
      return MaterialPageRoute(builder: (context) => UnknownView());
    case ListViewRoute:
      return MaterialPageRoute(builder: (context) => UnknownView());
    case DetailsViewRoute:
      return MaterialPageRoute(builder: (context) => UnknownView());
    default:
      return MaterialPageRoute(builder: (context) => UnknownView());
  }
}
