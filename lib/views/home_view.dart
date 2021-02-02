import 'package:flutter/material.dart';
import 'package:tour_place_app/views/collection_view.dart';
import 'package:tour_place_app/constants.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 25, left: 35, right: 35),
            padding: EdgeInsets.only(left: 40, right: 40, bottom: 35, top: 250),
            child: Center(
                child: Text(
              "Tour Place App",
              style: TextStyle(
                fontFamily: 'Oswald',
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            )),
            decoration: BoxDecoration(color: Color.fromRGBO(95, 20, 20, 1)),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              color: Color.fromRGBO(80, 20, 20, 1),
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 23, horizontal: 60),
              splashColor: Colors.blueAccent,
              onPressed: () {
                // Navigate to the second screen using a named route.
                // Navigator.pushNamed(context, CollectionViewRoute);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    settings: RouteSettings(
                        name: CollectionViewRoute, arguments: Map()),
                    builder: (context) => CollectionView(),
                  ),
                );
              },
              child: Text("View Places"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: FlatButton(
              color: Color.fromRGBO(80, 20, 20, 1),
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.symmetric(vertical: 23, horizontal: 60),
              splashColor: Colors.blueAccent,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  12.0)), //this right here
                          child: Container(
                            height: 270.0,
                            width: 230.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                      border: Border.symmetric(
                                          horizontal: BorderSide(
                                              width: 4,
                                              color: Color.fromRGBO(
                                                  140, 50, 50, 0.5))),
                                      color: Color.fromRGBO(95, 20, 20, 1),
                                    ),
                                    padding: EdgeInsets.all(15.0),
                                    child: Center(
                                      child: Text(
                                        'Are you sure?',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )),
                                Container(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'This will close the app for you.\n\nTHIS IS STILL BUGGY, especially in development mode!',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                Container(padding: EdgeInsets.only(top: 50.0)),
                                Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Color.fromRGBO(
                                                      24, 75, 167, 1.0),
                                            ),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "Back",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0),
                                                )))),
                                    Expanded(
                                        child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Color.fromRGBO(
                                                      201, 23, 23, 1.0),
                                            ),
                                            child: FlatButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  'Exit',
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18.0),
                                                )))),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ));
              },
              child: Text("Exit"),
            ),
          ),
        ],
      ),
    );
  }
}
