import 'package:ehlo55front/components/TextMont.dart';
import 'package:flutter/material.dart';

import 'HexColor.dart';

class SideBar extends StatefulWidget {
  String name;
  String id;
  String email;
  Color backgroundColorAvatar;
  Map<String, Map> mapTiles;
  SideBar(
      {this.name,
      this.id,
      this.email,
      this.backgroundColorAvatar,
      this.mapTiles});

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  List<ListTile> listTileGenerator = [];

  dynamic getTiles(dynamic mapTiles) {
    widget.mapTiles.forEach((key, value) {
      listTileGenerator.add(ListTile(
        leading: value["icon"],
        onTap: () => {},
        title: TextMont(
          text: key,
          textSize: 17,
        ),
      ));
    });
    return listTileGenerator;
  }

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.8;
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: HexColor("#ffffff"),
      ),
      child: Drawer(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: widget.backgroundColorAvatar,
                        radius: 35,
                      ),
                      //------------------------------------------------------------------------//
                      //------------TEM QUE FAZER A QUEBRA DO TEXTO NO EMAIL--------------------//
                      //------------------------------------------------------------------------//
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                        child: Flex(
                          direction: Axis.vertical,
                          children: <Widget>[
                            TextMont(
                              text: widget.name,
                              fontWeight: FontWeight.bold,
                              textAlign: TextAlign.start,
                            ),
                            TextMont(text: widget.email),
                            widget.id != null
                                ? TextMont(text: "id: " + widget.id)
                                : Text("")
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: HexColor("#000000"),
                  ),
                  ListTile(
                    onTap: () => {Navigator.pushNamed(context, '/')},
                    title: TextMont(
                      text: "Home",
                      textSize: 17,
                    ),
                    leading: Icon(
                      Icons.home,
                      color: HexColor("#000000"),
                      size: 30,
                    ),
                  ),
                  Divider(),
                  // for (var tilesName in widget.listTiles)

                  Column(
                    children: <Widget>[
                      for (var i in getTiles(widget.mapTiles)) i,
                      // ListTile(
                      //   onTap: () => {},
                      //   title: TextMont(
                      //     text: tilesName,
                      //     textSize: 17,
                      //   ),
                      // ),
                      // Divider(),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: <Widget>[
                ListTile(
                  onTap: () => {Navigator.pushNamed(context, '/')},
                  title: TextMont(
                    text: "Logout",
                    textSize: 17,
                  ),
                  leading: Icon(
                    Icons.clear,
                    color: HexColor("#000000"),
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
