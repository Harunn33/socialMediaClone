import 'package:flutter/material.dart';
import 'package:flutter_application_3/postCard.dart';

class ProfilePage extends StatelessWidget {
  final String? nameSurname;
  final String? username;
  final String? backgroundImage;
  final String? profilePhoto;
  final String? description;
  final String? time;
  ProfilePage(
      {this.nameSurname,
      this.username,
      this.backgroundImage,
      this.profilePhoto,
      this.description,
      this.time});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 230,
                  // color: Colors.red,
                ),
                Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("$backgroundImage"),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  left: 15,
                  bottom: 0,
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: AssetImage("$profilePhoto")),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(60.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 145,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "$nameSurname",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      Text(
                        "$username",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 60,
                  child: Container(
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey,
                        border: Border.all(width: 2.0, color: Colors.white)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.add_circle,
                            size: 18,
                          ),
                          SizedBox(
                            width: 3.0,
                          ),
                          Text(
                            "Takip Et",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ]),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 75,
              color: Colors.grey.withOpacity(.2),
              child: Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      sayac("Takipçi", "20K"),
                      sayac("Takip", "500"),
                      sayac("Paylaşım", "75")
                    ]),
              ),
            ),
            postCard(
              nameSurname: "$nameSurname",
              profilePhotoLink: "$profilePhoto",
              postLink: "$backgroundImage",
              description: "$description",
              time: "$time",
            )
          ],
        ));
  }

  Column sayac(String header, String number) {
    return Column(
      children: <Widget>[
        Text(
          number,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          header,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey),
        )
      ],
    );
  }
}
