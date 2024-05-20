import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddMagazineScreen extends StatefulWidget {
  const AddMagazineScreen({Key? key}) : super(key: key);

  @override
  State<AddMagazineScreen> createState() => _AddMagazineScreenState();
}

class _AddMagazineScreenState extends State<AddMagazineScreen> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {

    var displayInfo = MediaQuery.of(context);
    final double displayHeight = displayInfo.size.height;
    final double displayWidth = displayInfo.size.width;
    var imageUri = null;

    final _formKey = GlobalKey<FormState>();
    var magazineNameController = TextEditingController();
    var editorNameController = TextEditingController();
    String category = '';
    List<String> tags = [];
    String coverImageUrl = 'https://i.insider.com/5b15a8d65e48ec4b008b4594?width=750&format=jpeg&auto=webp';

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
                    'Add Magazine',
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
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.network(coverImageUrl),
                        Column(
                          children: [
                            TextFormField(
                              controller: magazineNameController,
                              decoration: InputDecoration(labelText: 'Magazine Name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Magazine Name';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              controller: editorNameController,
                              decoration: InputDecoration(labelText: 'Editor Name'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Enter your Editor Name';
                                }
                                return null;
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Dergi kapağı seçimi için bir işlem yapabilirsiniz.
                                // Örneğin, bir resim seçme ekranına yönlendirebilirsiniz.
                              },
                              child: Text('Kategori Seç'),
                            ),
                            SizedBox(height: 16.0),
                            ElevatedButton(
                              onPressed: () {
                                //  _uploadMagazine();
                              },
                              child: Text('Dergi Sec'),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    ElevatedButton(
                        onPressed: publishTheMagazine,
                        child: Text('Publish')
                    )
                  ],
                ),
              ),
            )

          ],
      )
    );

  }

  void publishTheMagazine() {
    //Save to Firebase and Publish
  }
}

void navigateToScreen(BuildContext context, Widget screen) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => screen));
}
