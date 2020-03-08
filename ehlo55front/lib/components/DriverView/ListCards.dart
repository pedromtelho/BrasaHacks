import 'package:ehlo55front/components/CustomCard.dart';
import 'package:ehlo55front/components/DriverView/MapUtils.dart';
import 'package:ehlo55front/models/InfoShip.dart';
import 'package:flutter/material.dart';
import '../TextMont.dart';

class ListCards extends StatefulWidget {
  List<CustomCard> card;
  ListCards(this.card);
  @override
  _ListCardsState createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  openMap(Map data) {
    InfoShip(
      productBrand: data["productBrand"],
      productType: data["productType"],
      quantity: data["quantity"],
    );
    String geolocation = data["geolocation"];
    List dataL = geolocation.split(' ');
    MapUtils.openMap(double.parse(dataL[0]), double.parse(dataL[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5),
            child: Column(
              children: <Widget>[
                for (var item in widget.card)
                  GestureDetector(
                    child: Card(
                      color: item.colorCard,
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: item.icon,
                            title: TextMont(text: item.textCard),
                          )
                        ],
                      ),
                    ),
                    onTap: () {
                      item.onTap == "map"
                          ? openMap(item.allData)
                          : item.onTap == "pay"
                              ? Navigator.pushNamed(context, '/Payment')
                              : print("");
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
