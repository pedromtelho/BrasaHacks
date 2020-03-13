import 'package:ehlo55front/components/CustomCard.dart';
import 'package:ehlo55front/components/DriverView/ListCards.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/SideBar.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/models/InfoMarketPayment.dart';
import 'package:ehlo55front/views/MyHomePage.dart';
import 'package:flutter/material.dart';

class MarketView extends StatefulWidget {
  String image;
  String meet;
  MarketView(this.image, this.meet);
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
      colorAppBar: HexColor("#000000"),
      component: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              widget.image,
              fit: BoxFit.fitWidth,
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: TextMont(
                      color: HexColor("#000000"),
                      fontWeight: FontWeight.w200,
                      text: "Boa Tarde,",
                      textSize: 40,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextMont(
                    color: HexColor("#000000"),
                    fontWeight: FontWeight.w200,
                    text: widget.meet,
                    textSize: 35,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Divider(),
            ListCards(cardsList),
          ],
        ),
      ),
      backgroundColor: HexColor("#ffffff"),
      sideBar: SideBar(
        backgroundColorAvatar: HexColor("#000000"),
        id: "13412341",
        mapTiles: {
          "Histórico": {
            "icon": Icon(
              Icons.history,
              color: HexColor("#000000"),
              size: 30,
            )
          },
          "Reportar problema": {
            "icon": Icon(
              Icons.info_outline,
              color: HexColor("#000000"),
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
