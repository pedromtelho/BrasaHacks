import 'dart:convert';
import 'package:ehlo55front/components/CustomCard.dart';
import 'package:ehlo55front/components/DriverView/MapUtils.dart';
import 'package:ehlo55front/models/InfoShip.dart';
import 'package:ehlo55front/views/DriverViews/DriverPayment.dart';
import 'package:flutter/material.dart';
import '../TextMont.dart';
import 'package:http/http.dart' as http;

class ListCards extends StatefulWidget {
  List<CustomCard> card;
  ListCards(this.card);
  @override
  _ListCardsState createState() => _ListCardsState();
}

class _ListCardsState extends State<ListCards> {
  String geolocation;
  List<String> data;

  Future fetchData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      geolocation = json.decode(response.body)["geolocation"];
      data = geolocation.split(' ');
      MapUtils.openMap(double.parse(data[0]), double.parse(data[1]));
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future getData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/pay',
          arguments: InfoShip(
            json.decode(response.body)["quantity"].toString(),
            json.decode(response.body)["productType"].toString(),
            json.decode(response.body)["productBrand"].toString(),
          ));
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
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
                      if (item.onTap == "map") {
                        fetchData(
                            'http://192.168.15.20:3000/shipping/next/5e651dc4c4320757c93594f5');
                      } else if (item.onTap == "pay") {
                        getData(
                            'http://192.168.15.20:3000/shipping/next/5e651dc4c4320757c93594f5');
                      } else {
                        Navigator.pushNamed(
                          context,
                          item.onTap,
                        );
                      }
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
