import 'package:flutter/material.dart';

class postCard extends StatelessWidget {
  final String? profilePhotoLink;
  final String? nameSurname;
  final String? time;
  final String? postLink;
  final String? description;

  const postCard(
      {Key? key,
      this.profilePhotoLink,
      this.nameSurname,
      this.time,
      this.postLink,
      this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
      child: Material(
        elevation: 2.0,
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          padding: EdgeInsets.all(15.0),
          width: double.infinity,
          height: 380.0,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        width: 50.0,
                        height: 50.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.indigo,
                          image: DecorationImage(
                            image: AssetImage("${profilePhotoLink}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "$nameSurname",
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "$time",
                              style: TextStyle(
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Icon(Icons.more_vert)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  "$description",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Image.asset(
                  "$postLink",
                  width: double.infinity,
                  height: 190.0,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  iconBtn(
                    myicon: Icons.favorite,
                    mytext: "Beğen",
                    myFunction: () => {print("Beğen")},
                  ),
                  iconBtn(
                    myicon: Icons.messenger_outline,
                    mytext: "Yorum Yap",
                    myFunction: () => {print("Yorum")},
                  ),
                  FlatButton.icon(
                      onPressed: () => {},
                      icon: Icon(
                        Icons.share,
                        color: Colors.grey,
                      ),
                      label: Text(
                        "Paylaş",
                        style: TextStyle(
                            color: Colors.grey, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class iconBtn extends StatelessWidget {
  final IconData? myicon;
  final String? mytext;
  final myFunction;
  iconBtn({this.myicon, this.mytext, this.myFunction});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: myFunction,
        child: Container(
          padding: EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Icon(
                myicon,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  "$mytext",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
