import 'package:ehlo55front/components/CustomCard.dart';
import 'package:ehlo55front/components/DriverView/ListCards.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/SideBar.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/models/InfoMarketPayment.dart';
import 'package:ehlo55front/views/MyHomePage.dart';
import 'package:flutter/material.dart';

class MarketView extends StatefulWidget {
  @override
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  String geolocation;
  List<String> data;
  Map allData;

  @override
  Widget build(BuildContext context) {
    List<CustomCard> cardsList = [
      CustomCard(
        allData: allData,
        colorCard: HexColor("#EEEEEE"),
        textCard: "Pagamento",
        icon: Icon(Icons.attach_money),
        onTap: "payBill",
      ),
      CustomCard(
        allData: allData,
        colorCard: HexColor("#EEEEEE"),
        textCard: "Verificação de estoque",
        icon: Icon(Icons.storage),
        onTap: "payBill",
      )
    ];

    return MyHomePage(
      colorAppBar: HexColor("#2E008B"),
      component: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: TextMont(
              fontWeight: FontWeight.w200,
              textAlign: TextAlign.left,
              text: "Boa tarde,",
              textSize: 40,
            ),
          ),
          Flexible(
            flex: 1,
            child: TextMont(
              fontWeight: FontWeight.w200,
              textAlign: TextAlign.end,
              text: "Grupo Pão de Açúcar :)",
              textSize: 35,
            ),
          ),
          Divider(
            color: HexColor("#2E008B"),
            height: 30,
          ),
          ListCards(cardsList),
        ],
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
        email: "grupopaodeacucar@gpa.com",
        name: "Grupo Pão de Açúcar",
      ),
    );
  }
}
