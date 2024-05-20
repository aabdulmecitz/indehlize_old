import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Others/CustomSearchDelegate.dart';
import '../Others/List in List/magazineModel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isSearchOpen = false;
  bool isDrawerOpen = false;
  List<String> searchTerms = [
    //List of magazines from fb
    'learn',
    'like',
    'strowberry',
    'love',
    'see',
    'suprize'
  ];

  @override
  Widget build(BuildContext context) {
    var displayInfo = MediaQuery.of(context);
    final double displayHeight = displayInfo.size.height;
    final double displayWidth = displayInfo.size.width;
    return SingleChildScrollView(

      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(Icons.menu),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    Text(
                      'InDehliz',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          decoration: TextDecoration.none
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () async{
                        await showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(searchTerms),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200]
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: displayWidth/50),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Recent",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                              wordSpacing: 4,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Row(
                            //Recent Uploaded Magazines
                            //Filter the magazines as a list
                              children : [
                                magazineModel(imageUrl: 'https://scontent.fist10-1.fna.fbcdn.net/v/t39.30808-6/321827037_553526156689509_1264089618627205822_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=BrsoyCdY7V8AX9QH7-b&_nc_ht=scontent.fist10-1.fna&oh=00_AfDkJ0kDTPWG6uD-8K366HU1PtBCYcnWNXJUzOHfLynG-A&oe=6443D5B7',
                                    editorName: "editorName",
                                    publisherUsername: "publisherUsername",
                                    publisherId: "publisherId",
                                    magazineName: "magazineName",
                                    magazineId: "magazineId",
                                    date: "date",
                                    categories: ["Car","Education","Kids"],
                                    tags: ["coffe","kitchen"]),
                                magazineModel(imageUrl: "https://scontent.fist10-1.fna.fbcdn.net/v/t39.30808-6/317303815_854457119232104_2666979771311848948_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=n0g6lfgvq4cAX-b3wJy&_nc_ht=scontent.fist10-1.fna&oh=00_AfBfiZ7RhJjBoeDcDPd8y3eH6FzpCfOIDLA_s6RiuUlaPQ&oe=6443D1B0",
                                    editorName: "editorName2",
                                    publisherUsername: "publisherUsername2",
                                    publisherId: "publisherId2",
                                    magazineName: "magazineName2",
                                    magazineId: "magazineId2",
                                    date: "date2",
                                    categories: ["Car","Kids"],
                                    tags: ["coffe","fish"]),
                                magazineModel(imageUrl: 'https://scontent.fist10-1.fna.fbcdn.net/v/t39.30808-6/321827037_553526156689509_1264089618627205822_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=730e14&_nc_ohc=BrsoyCdY7V8AX9QH7-b&_nc_ht=scontent.fist10-1.fna&oh=00_AfDkJ0kDTPWG6uD-8K366HU1PtBCYcnWNXJUzOHfLynG-A&oe=6443D5B7',
                                    editorName: "editorName",
                                    publisherUsername: "publisherUsername",
                                    publisherId: "publisherId",
                                    magazineName: "magazineName",
                                    magazineId: "magazineId",
                                    date: "date",
                                    categories: ["Car","Education","Kids"],
                                    tags: ["coffe","kitchen"]),
                                magazineModel(imageUrl: "https://scontent.fist10-1.fna.fbcdn.net/v/t39.30808-6/317303815_854457119232104_2666979771311848948_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=730e14&_nc_ohc=n0g6lfgvq4cAX-b3wJy&_nc_ht=scontent.fist10-1.fna&oh=00_AfBfiZ7RhJjBoeDcDPd8y3eH6FzpCfOIDLA_s6RiuUlaPQ&oe=6443D1B0",
                                    editorName: "editorName2",
                                    publisherUsername: "publisherUsername2",
                                    publisherId: "publisherId2",
                                    magazineName: "magazineName2",
                                    magazineId: "magazineId2",
                                    date: "date2",
                                    categories: ["Car","Kids"],
                                    tags: ["coffe","fish"]),
                              ]
                          ),
                        ),
                      ),

                    ]
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
