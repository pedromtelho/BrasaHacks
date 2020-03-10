import 'dart:convert';

import 'package:ehlo55front/components/CustomCard.dart';
import 'package:ehlo55front/components/DriverView/ListCards.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/SideBar.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/views/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BaristaView extends StatefulWidget {
  @override
  _BaristaViewState createState() => _BaristaViewState();
}

class _BaristaViewState extends State<BaristaView> {
  String geolocation;
  List<String> data;

  Future fetchData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      geolocation = json.decode(response.body)["geolocation"];
      data = geolocation.split(' ');
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData(
        'http://192.168.50.94:3000/shipping/next/5e651dc4c4320757c93594f5');
    List<CustomCard> cardsList = [
      CustomCard(
          colorCard: HexColor("#EEEEEE"),
          textCard: "Pedidos",
          icon: Icon(Icons.event_note),
          onTap: "/BaristaOrders",
          data: data),
      CustomCard(
        colorCard: HexColor("#EEEEEE"),
        textCard: "Estoque",
        icon: Icon(Icons.store),
        onTap: "/Storage",
      ),
      CustomCard(
        colorCard: HexColor("#EEEEEE"),
        textCard: "Pagamento",
        icon: Icon(Icons.attach_money),
        onTap: "/Payment",
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
