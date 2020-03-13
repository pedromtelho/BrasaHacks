import 'package:ehlo55front/models/InfoMarketPayment.dart';
import 'package:flutter/material.dart';

class Valid extends StatefulWidget {
  @override
  _ValidState createState() => _ValidState();
}

class _ValidState extends State<Valid> {
  @override
  Widget build(BuildContext context) {
    final InfoMarketPayment args = ModalRoute.of(context).settings.arguments;
    print(args.data);
    return Container();
  }
}
