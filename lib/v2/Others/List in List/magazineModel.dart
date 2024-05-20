import 'package:flutter/material.dart';

class magazineModel extends StatelessWidget {
  final String imageUrl;
  final String editorName;
  final String publisherUsername;
  final String publisherId;
  final String magazineName;
  final String magazineId;
  final String date;
  final List<String> categories;
  final List<String?> tags;
  final bool isMagazine = true;
  final bool isDownloaded = false;
 // final Document = pdfDocumet;




  const magazineModel({
    Key? key,
    required this.imageUrl,
    required this.editorName,
    required this.publisherUsername,
    required this.publisherId,
    required this.magazineName,
    required this.magazineId,
    required this.date,
    required this.categories,
    required this.tags,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              width: 100,
              height: 170,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Image(
                        height: 170,
                        width: 100,
                        image: NetworkImage(imageUrl),
                      ),
                    ),
                    Text(
                      magazineName,
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 10,
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
              ),
            ),
          ),],
      ),
    );
  }
}