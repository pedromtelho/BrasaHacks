import 'package:ehlo55front/components/CustomCard.dart';
import 'package:ehlo55front/components/DriverView/ListCards.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/SideBar.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/views/MyHomePage.dart';
import 'package:flutter/material.dart';

class DriverView extends StatefulWidget {
  @override
  _DriverViewState createState() => _DriverViewState();
}

class _DriverViewState extends State<DriverView> {
  String geolocation;
  List<String> data;
  Map allData;

  @override
  Widget build(BuildContext context) {
    List<CustomCard> cardsList = [
      CustomCard(
          allData: allData,
          colorCard: HexColor("#EEEEEE"),
          textCard: "Rotas",
          icon: Icon(Icons.airport_shuttle),
          onTap: "map",
          data: data),
      CustomCard(
        allData: allData,
        colorCard: HexColor("#EEEEEE"),
        textCard: "Pagamento",
        icon: Icon(Icons.attach_money),
        onTap: "pay",
      )
    ];

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
              height: 30,
            ),
            ListCards(cardsList),
          ],
        ),
      ),
      backgroundColor: HexColor("#ffffff"),
      sideBar: SideBar(
        backgroundColorAvatar: HexColor("#2E008B"),
        id: "13412341",
        mapTiles: {
          "Histórico": {
            "icon": Icon(
              Icons.history,
              color: HexColor("#2E008B"),
              size: 30,
            )
          },
          "Reportar problema": {
            "icon": Icon(
              Icons.info_outline,
              color: HexColor("#2E008B"),
              size: 30,
            )
          }
        },
        email: "joaquim@joaquim.com",
        name: "Joaquim",
      ),
    );
  }
}
