import 'package:flutter/material.dart';
import 'package:relieflink/relief_technique_utils.dart';

class ReliefRateScreen extends StatelessWidget {

  final ReliefTechniqueData data;

  const ReliefRateScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ), // Insert header here
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: RatingSection(data: data),
      ),
      bottomNavigationBar: const Text("NAVIGATION BAR HERE"), // Insert navigation bar here
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
      Text(
          "How effective was ${widget.data.activityName}?",
          style: const TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          )
      ),
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
        ])
      ),
      FavoriteButton(data: widget.data),
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
      style: OutlinedButton.styleFrom(primary: Colors.white, backgroundColor: Colors.orange),
      child: const Text("Rate"),
      onPressed: () {
        print("Rated");
      },
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final bool initialFavorite;
  FavoriteButton({Key? key, required ReliefTechniqueData data}) :
        initialFavorite = data.favorite,
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
    _favorite = widget.initialFavorite;
    if (_favorite) {
      _iconData = Icons.star;
      _text = "Unmark as favorite";
    } else {
      _iconData = Icons.star_outline;
      _text = "Mark as favorite";
    }
  }

  void flipFavorite() {
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
    return Row(
        children:[
          IconButton(
              onPressed: flipFavorite,
              icon: Icon(
                _iconData,
                color: Colors.yellow,
              )
          ),
          Text(_text)
        ]
    );
  }
}
