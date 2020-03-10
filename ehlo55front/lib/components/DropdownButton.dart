import 'package:ehlo55front/components/TextMont.dart';
import 'package:flutter/material.dart';

class DropdownButtonForm extends StatefulWidget {
  final String hintText;
  final double hintFontSize;
  final double underlineHeight;
  final Color underlineColor;
  final Color hintColorText;
  final Icon icon;
  final double iconSize;
  String dropdownValue;
  final List<String> dropdownItems;
  final Color itemsColor;
  final bool navigate;
  final dynamic route;

  DropdownButtonForm(
      {this.hintText,
      this.hintFontSize,
      this.underlineHeight,
      this.underlineColor,
      this.hintColorText,
      this.icon,
      this.iconSize,
      this.dropdownValue,
      this.dropdownItems,
      this.itemsColor,
      this.navigate,
      this.route});

  @override
  _DropdownButtonFormState createState() => _DropdownButtonFormState();
}

class _DropdownButtonFormState extends State<DropdownButtonForm> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: TextMont(
        color: widget.hintColorText,
        textSize: widget.hintFontSize,
        text: widget.hintText,
      ),
      icon: widget.icon,
      iconSize: widget.iconSize,
      elevation: 16,
      style: TextStyle(color: Colors.white),
      underline: Container(
        height: widget.underlineHeight,
        color: widget.underlineColor,
      ),
      onChanged: (String newValue) {
        setState(
          () {
            widget.dropdownValue = newValue;
            if (widget.navigate == true) {
              Navigator.pushNamed(context, '/' + newValue);
            }
          },
        );
      },
      items: widget.dropdownItems.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
            value: value,
            child: TextMont(
              text: value,
              color: widget.itemsColor,
            ));
      }).toList(),
    );
  }
}
