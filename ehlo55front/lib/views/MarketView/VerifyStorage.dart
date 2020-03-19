import 'dart:convert';
import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/SideBar.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:ehlo55front/models/InfoStorage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../MyHomePage.dart';

class VerifyStorage extends StatefulWidget {
  @override
  _VerifyStorageState createState() => _VerifyStorageState();
}

class _VerifyStorageState extends State<VerifyStorage> {
  var list;

  Future getStorageData(String url) async {
    final response = await http.get(
      url + '5e71708995d6b8119f2518af',
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      Navigator.pushNamed(context, '/Verify',
          arguments: InfoStorage(json.decode(response.body)));
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future deleteItem(String url) async {
    final response = await http.delete(
      url,
      headers: {"Content-Type": "application/json"},
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<void> _neverSatisfied(String url) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: TextMont(
            text: 'Tem certeza que deseja deletar o item?',
            textAlign: TextAlign.center,
            fontWeight: FontWeight.w500,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                TextMont(
                  textAlign: TextAlign.center,
                  text:
                      'Ao deletar o item você se responsabiliza pela retirada desse item do estoque.',
                  textSize: 15,
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Sim'),
              onPressed: () {
                deleteItem(url);
                getStorageData('http://ehlo.toranja.xyz/stores/');
              },
            ),
            FlatButton(
              child: Text('Não'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    InfoStorage args = ModalRoute.of(context).settings.arguments;
    return MyHomePage(
      component: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: TextMont(
              fontWeight: FontWeight.w200,
              color: HexColor("#000000"),
              textAlign: TextAlign.center,
              text:
                  "Destaque os adesivos de cor branca da caixa de acordo com a legenda abaixo",
              textSize: 30,
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: args.data["data"]["packObjs"].length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Card(
                  color: HexColor("#EFEFEF"),
                  child: Column(
                    children: [
                      ListTile(
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            _neverSatisfied("http://ehlo.toranja.xyz/stores/" +
                                args.data["data"]["packObjs"][index]
                                        ["identificationScheme"]
                                    .toString() +
                                "/5e71708995d6b8119f2518af");
                          },
                        ),
                        title: Text(
                          args.data["data"]["packObjs"][index]
                                  ["identificationScheme"]
                              .toString()
                              .replaceAll('0', '⚫')
                              .replaceAll('1', '⚪'),
                          style: TextStyle(fontSize: 22),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      colorAppBar: HexColor("#000000"),
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
