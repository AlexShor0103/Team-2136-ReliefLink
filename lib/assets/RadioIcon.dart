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
      children: [
        _icon(0, text: "No way", icon: Icons.face),
        _icon(1, text: "Maybe", icon: Icons.local_movies),
        _icon(2, text: "Looks good", icon: Icons.local_pizza),
        _icon(3, text: "Can't wait", icon: Icons.local_fire_department),
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
              color: _selected == index ? Colors.red : null,
            ),
            Text(text, style: TextStyle(color: _selected == index ? Colors.green : null)),
          ],
        ),
        onTap: () => setState(
              () {
            _selected = index;
          },
        ),
      ),
    );
  }
}