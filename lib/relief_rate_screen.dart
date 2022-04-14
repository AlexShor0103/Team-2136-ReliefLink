import 'package:flutter/material.dart';
import 'package:relieflink/relief_technique_utils.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReliefRateScreen extends StatelessWidget {

  final ReliefTechniqueData data;

  const ReliefRateScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title: const Text("HEADER HERE")), // Insert header here
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
  double _ratingValue = defaultRating;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text("How effective was ${widget.data.activityName}?"),
      RatingBar(
        initialRating: defaultRating,
        allowHalfRating: false,
        onRatingUpdate: (value) {
          setState(() {
            _ratingValue = value;
          });
        },
        ratingWidget: RatingWidget(
            full: const Icon(Icons.star, color: Colors.yellow),
            half: const Icon(Icons.star_half, color: Colors.yellow),
            empty: const Icon(Icons.star_outline, color: Colors.yellow)
        ),
      ),
      Text("THIS IS FOR DEBUGGING: Current rating is $_ratingValue."),
      const RateButton()

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