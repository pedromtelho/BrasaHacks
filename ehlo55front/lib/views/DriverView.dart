import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/SideBar.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/views/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DriverView extends StatefulWidget {
  @override
  _DriverViewState createState() => _DriverViewState();
}

class _DriverViewState extends State<DriverView> {
  @override
  Widget build(BuildContext context) {
    return MyHomePage(
      colorAppBar: HexColor("#2E008B"),
      component: Container(
        child: Column(
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 0, 0),
                  child: TextMont(
                    text: "Boa Tarde,",
                    textSize: 40,
                  ),
                ),
              ],
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: TextMont(
                    text: "Joaquim :)",
                    textSize: 35,
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
            Divider(
              color: HexColor("#2E008B"),
              height: 15,
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(15.0),
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: Column(children: <Widget>[
                      Card(
                        color: HexColor("#EEEEEE"),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.airport_shuttle),
                              title: TextMont(text: "Rotas"),
                            )
                          ],
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: HexColor("#ffffff"),
      sideBar: SideBar(
        backgroundColorAvatar: HexColor("#2E008B"),
        id: "13412341",
        listTiles: ["Histórico", "Reportar problema"],
        email: "joaquim@joaquim.com",
        name: "Joaquim",
      ),
    );
  }
}
