import 'package:ehlo55front/components/HexColor.dart';
import 'package:ehlo55front/components/TextMont.dart';
import 'package:flutter/material.dart';
import 'package:swipe_button/swipe_button.dart';

class DragButton extends StatefulWidget {
  String route;
  Object object;
  DragButton({this.route, this.object});
  @override
  _DragButtonState createState() => _DragButtonState();
}

class _DragButtonState extends State<DragButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SwipeButton(
          colorBar: HexColor("#2E008B"),
          thumb: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                widthFactor: 0.60,
                child: Icon(
                  Icons.chevron_right,
                  size: 40.0,
                  color: HexColor("#000000"),
                ),
              ),
            ],
          ),
          content: Center(
              child: TextMont(
            text: "DESLIZE PARA CONFIRMAR",
            textSize: 13,
            color: HexColor("#FFFFFF"),
          )),
          onChanged: (result) {
            if (result == SwipePosition.SwipeRight) {
              Navigator.pushNamed(context, widget.route,
                  arguments: widget.object);
            } else {}
          },
        ),
      ),
    );
  }
}
