import 'package:flutter/material.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import '../../utils/data_storage.dart';

class ReliefRateScreen extends StatelessWidget {
  final ReliefTechniqueData data;

  const ReliefRateScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Top_Relief(), // Insert header here
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: RatingSection(data: data),
      ),
    );
  }
}

class RatingSection extends StatefulWidget {
  final ReliefTechniqueData data;
  const RatingSection({Key? key, required this.data}) : super(key: key);

  @override
  State<RatingSection> createState() => _RatingSectionState();
}

class _RatingSectionState extends State<RatingSection> {
  static const double defaultRating = 3;
  double _value = defaultRating;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("How effective was ${widget.data.activityName}?",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )),
      Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Slider(
              min: 0,
              max: 5,
              value: _value,
              onChanged: ((value) {
                setState(() {
                  _value = value;
                });
              }),
              divisions: 5,
            ),
            Text("$_value"),
          ])),
      Center(child: FavoriteButton(data: widget.data)),
      const Padding(
        child: RateButton(),
        padding: EdgeInsets.all(20),
      ),
    ]);
  }
}

class RateButton extends StatelessWidget {
  const RateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          primary: Colors.white, backgroundColor: Colors.orange),
      child: const Text("Rate"),
      onPressed: () {
        DataStorage.saveToDisk();
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final ReliefTechniqueData activity;
  FavoriteButton({Key? key, required ReliefTechniqueData data})
      : activity = data,
        super(key: key);

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool _favorite = false;
  IconData _iconData = Icons.star_outline;
  String _text = "Mark as favorite";

  @override
  void initState() {
    _favorite = widget.activity.favorite;
    if (_favorite) {
      _iconData = Icons.star;
      _text = "Unmark as favorite";
    } else {
      _iconData = Icons.star_outline;
      _text = "Mark as favorite";
    }
  }

  void flipFavorite() {
    widget.activity.toggleActivityFavorite();
    DataStorage.updateReliefTechniqueData(widget.activity);
    setState(() {
      _favorite = !_favorite;
      if (_favorite) {
        _iconData = Icons.star;
        _text = "Unmark as favorite";
      } else {
        _iconData = Icons.star_outline;
        _text = "Mark as favorite";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
          onPressed: flipFavorite,
          icon: Icon(
            _iconData,
            color: Colors.yellow,
          )),
      Text(_text)
    ]);
  }
}
