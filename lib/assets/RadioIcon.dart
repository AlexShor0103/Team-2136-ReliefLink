import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioIcon extends StatefulWidget {
  @override
  _RadioIconState createState() => _RadioIconState();
}

class _RadioIconState extends State<RadioIcon> {
  int _selected = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _icon(0, text: "Sad", icon: Icons.sentiment_dissatisfied_outlined),
        _icon(1, text: "Neutral", icon: Icons.sentiment_neutral_outlined),
        _icon(2, text: "Happy", icon: Icons.sentiment_very_satisfied_outlined),
        ],
    );
  }

  Widget _icon(int index, {required String text, required IconData icon}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkResponse(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 40,
              color: _selected == index ? Colors.green : null,
            ),
            Text(text, style: TextStyle(color: _selected == index ? Colors.green : null)),
          ],
        ),
        onTap: () => setState(
              () {
            _selected = index;
            if (index == 0) {

            }

          },
        ),
      ),
    );
  }
}