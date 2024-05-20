import 'package:flutter/material.dart';

import '../Others/CustomSearchDelegate.dart';
import '../Others/List in List/magazineModel.dart';
import '../configuration.dart';

class MyLibraryScreen extends StatefulWidget {
  const MyLibraryScreen({Key? key}) : super(key: key);

  @override
  State<MyLibraryScreen> createState() => _MyLibraryScreenState();
}

class _MyLibraryScreenState extends State<MyLibraryScreen> {
  @override
  Widget build(BuildContext context) {
    var displayInfo = MediaQuery.of(context);
    final double displayHeight = displayInfo.size.height;
    final double displayWidth = displayInfo.size.width;
    double xOffset = 0;
    double yOffset = 0;
    double scaleFactor = 1;

    bool isSearchOpen = false;
    bool isDrawerOpen = false;

    return Container(
        color: Colors.grey[200],
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    child: Icon(Icons.arrow_back_ios),
                    onTap: () {
                      setState(() {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  Text(
                    'My Library',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black87,
                        decoration: TextDecoration.none
                    ),
                  ),
                  SizedBox(

                  ),
                ],
              ),
            ),

          ],
        )
    );
  }
}
