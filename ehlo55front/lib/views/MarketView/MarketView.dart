import 'package:ehlo55front/components/CustomCard.dart';
import 'package:ehlo55front/components/DriverView/ListCards.dart';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/SideBar.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/views/MyHomePage.dart';
import 'package:flutter/material.dart';

class MarketView extends StatefulWidget {
  String image;
  String meet;
  String flag;
  MarketView(this.image, this.meet, this.flag);
  @override
  _MarketViewState createState() => _MarketViewState();
}

class _MarketViewState extends State<MarketView> {
  String geolocation;
  List<String> data;
  Map allData;
  List<CustomCard> cardsList;

  buildCards() {
    if (widget.flag == "market") {
      cardsList = [
        CustomCard(
          whoClicked: widget.flag,
          allData: allData,
          colorCard: HexColor("#EEEEEE"),
          textCard: "Confirmar recebimento de carga (CDD's)",
          icon: Icon(
            Icons.check,
            size: 30,
          ),
          onTap: "payBill",
        ),
        CustomCard(
          whoClicked: widget.flag,
          allData: allData,
          colorCard: HexColor("#EEEEEE"),
          textCard: "Adicionar ao estoque",
          icon: Icon(
            Icons.playlist_add,
            size: 30,
          ),
          onTap: "addTo",
        ),
        CustomCard(
          whoClicked: widget.flag,
          allData: allData,
          colorCard: HexColor("#EEEEEE"),
          textCard: "Verificar estoque",
          icon: Icon(
            Icons.storage,
          ),
          onTap: "verify",
        )
      ];
    }
    if (widget.flag == "bar") {
      cardsList = [
        CustomCard(
          whoClicked: widget.flag,
          allData: allData,
          colorCard: HexColor("#EEEEEE"),
          textCard: "Confirmar recebimento de carga",
          icon: Icon(
            Icons.check,
            size: 30,
          ),
          onTap: "payBill",
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    buildCards();
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
