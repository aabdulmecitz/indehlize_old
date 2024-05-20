import 'package:flutter/material.dart';
import 'package:indehlizi/Auth.dart';
import '../Others/DrawerProvider.dart';
import 'AboutScreen.dart';
import 'AddMagazineScreen.dart';
import 'FAQScreen.dart';
import 'FavoritesScreen.dart';
import 'HintScreen.dart';
import 'HomeScreen.dart';
import 'Login Signup/LoginScreen.dart';
import 'MyLibraryScreen.dart';
import 'SavedScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Auth _auth = Auth();
  var username = "owner";
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
    var displayInfo = MediaQuery.of(context).size;
    var displayHeight = displayInfo.height;
    var displayWidth = displayInfo.width;


    return Scaffold(
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.zero,

          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.teal,
                  Colors.lightBlue,
                ]
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.zero,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.transparent,
                            Colors.teal
                          ]
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: displayHeight/10,
                            child: Image.asset('assets/logos/logo.png')),
                        SizedBox(height: 20),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            CircleAvatar(),
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ahmet Abdulmecit Ozkaya',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                    '@$username',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold)
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      NewRow(
                          text: 'Home',
                          icon: Icons.home_outlined,
                          onTap: () => {
                            DrawerProvider().drawerIndex = 0
                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      NewRow(
                          text: 'Add Magazine',
                          icon: Icons.library_add_outlined,
                          onTap: () => {
                            navigateToScreen(context, AddMagazineScreen()),
                          }
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NewRow(
                        text: 'My Library',
                        icon: Icons.local_library_outlined,
                        onTap: (){
                          navigateToScreen(
                              context, MyLibraryScreen()
                          );
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NewRow(
                        text: 'Saved',
                        icon: Icons.bookmark_border,
                        onTap: (){
                          navigateToScreen(context, SavedScreen());
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NewRow(
                        text: 'Favorites',
                        icon: Icons.favorite_border,
                        onTap: (){
                          navigateToScreen(context, FavoritesScreen());
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NewRow(
                        text: 'Hint',
                        icon: Icons.lightbulb_outline,
                        onTap: (){
                          navigateToScreen(context, HintScreen());
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NewRow(
                        text: 'About',
                        icon: Icons.info_outline_rounded,
                        onTap: (){
                          navigateToScreen(context, AboutScreen());
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      NewRow(
                        text: 'FAQ',
                        icon: Icons.question_answer_outlined,
                        onTap: (){
                          navigateToScreen(context, FAQScreen());
                        },

                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: GestureDetector(
                    onTap: () => signOut(context), // Sign out işlevi
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.cancel,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Sign Out',
                          style: TextStyle(color: Colors.white.withOpacity(0.5)
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    height: 20),

              ],
            ),
          ),
        ),
      ),
      body: HomeScreen(),
    );
  }

  void signOut(BuildContext context) async {
    await _auth.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}



void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? onTap;

  const NewRow({
    Key? key,
    required this.icon,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}