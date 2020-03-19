import 'package:flutter/material.dart';

class CustomCard {
  String id;
  String whoClicked;
  Map allData;
  List data;
  Color colorCard;
  String textCard;
  Icon icon;
  String onTap;
  CustomCard(
      {this.id,
      this.whoClicked,
      this.colorCard,
      this.textCard,
      this.icon,
      this.onTap,
      this.data,
      this.allData});
}
