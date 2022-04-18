import "package:flutter/material.dart";
import 'package:flutter_application_3/profilePage.dart';
import 'postCard.dart';
import 'profilePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "SocialWorld",
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.grey,
            size: 33.0,
          ),
          onPressed: () => {},
        ),
        title: Text(
          "SocialWorld",
          style: TextStyle(fontSize: 20.0, color: Colors.grey),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.green.shade400,
              size: 33.0,
            ),
            onPressed: () => {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: <Widget>[
                        notifications("Kamil seni dürttü", "3 hafta önce"),
                        notifications(
                            "Ali fotoğrafına yorum bıraktı", "3 dk önce"),
                        notifications("Ahmet seni beğendi", "3 hafta önce"),
                        notifications("Kerim seni siktiiiii", "3 saat önce"),
                      ],
                    );
                  })
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 100.0,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 3.0),
                    blurRadius: 5.0),
              ],
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                profileCard(
                    "kerim.zigetvar",
                    "assets/kerim.jpg",
                    "Kerim Altun",
                    "assets/background.jpg",
                    "Güzel foto harbi",
                    "1 hafta önce"),
                profileCard("ozhasan", "assets/hasan.jpg", "Hasan Öz",
                    "assets/background1.jpg", "Bok gibi", "1 gün önce"),
                profileCard(
                    "halitarzpnr",
                    "assets/halit.jpg",
                    "Halit Arzupınar",
                    "assets/background2.jpg",
                    "Cacıkk",
                    "1 ay önce"),
                profileCard("selmanats", "assets/selman.jpg", "Selman Ateş",
                    "assets/background3.jpg", "Mükemmelll", "2 saat önce"),
                profileCard(
                    "hasanali",
                    "assets/kuzen.jpg",
                    "Hasan Ali Yelli",
                    "assets/background4.jpg",
                    "Helal olsun dayıogliiii",
                    "30 dakika önce"),
                profileCard("bahri1903", "assets/bahri.jpg", "Bahri Doğru",
                    "assets/background5.jpg", "Üfffff", "3 ay önce"),
              ],
            ),
          ),
          postCard(
            nameSurname: "Hasan ÖZ",
            profilePhotoLink: "assets/hasan.jpg",
            postLink: "assets/hasan.jpg",
            description: "Bok gibi foto ama olsun",
            time: "1 saat önce",
          ),
          postCard(
            nameSurname: "Kerim Altun",
            profilePhotoLink: "assets/kerim.jpg",
            postLink: "assets/kerim.jpg",
            description: "Bu ne anasını derbeder bir haldeyim",
            time: "1 hafta önce",
          ),
          postCard(
            nameSurname: "Halit Arzupınar",
            profilePhotoLink: "assets/halit.jpg",
            postLink: "assets/halit.jpg",
            description: "Tipi kes :)",
            time: "1 ay önce",
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green.shade700,
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
    );
  }

  Padding notifications(String notifText, String notifTime) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            notifText,
            style: TextStyle(fontSize: 16),
          ),
          Text(notifTime)
        ],
      ),
    );
  }

  Widget profileCard(String username, String imageLink, String nameSurname,
      String backgroundImage, String description, String time) {
    return Material(
      child: InkWell(
        onTap: () async {
          String data = await Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return ProfilePage(
              profilePhoto: imageLink,
              username: username,
              nameSurname: nameSurname,
              backgroundImage: backgroundImage,
              description: description,
              time: time,
            );
          }));
          print(data);
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: <Widget>[
              Stack(
                alignment: Alignment.topRight,
                children: <Widget>[
                  Hero(
                    tag: username,
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            width: 2.0,
                            color: Colors.grey,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(70.0),
                        image: DecorationImage(
                            image: AssetImage(imageLink), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Container(
                    width: 20.0,
                    height: 20.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(width: 2.0, color: Colors.white)),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  username,
                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
