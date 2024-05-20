import 'package:flutter/material.dart';
import 'package:indehlizi/v2/pages/FavoritesScreen.dart';
import 'Others/DrawerProvider.dart';
import 'configuration.dart';
import 'pages/AboutScreen.dart';
import 'pages/AddMagazineScreen.dart';
import 'pages/FAQScreen.dart';
import 'pages/HintScreen.dart';
import 'pages/MyLibraryScreen.dart';
import 'pages/SavedScreen.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  var username = "owner";

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryGreen,
      padding: EdgeInsets.only(top:50,bottom: 70,left: 10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(),
                SizedBox(width: 10,),
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
            Spacer(),
            Column(
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
                      navigateToScreen(context, AddMagazineScreen())
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
            Spacer(),
            GestureDetector(
              onTap: (){
                signOut();
              },
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
            )
          ],
        ),
      ),
    );
  }
}

signOut() {
  //Sign Out
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
