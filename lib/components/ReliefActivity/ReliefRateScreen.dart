import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:relieflink/utils/relief_technique_utils.dart';
import 'package:relieflink/components/Navigation/TopBars.dart';
import '../../utils/data_storage.dart';
import 'package:relieflink/components/likert.dart';

class ReliefRateScreen extends StatelessWidget {
  final ReliefTechniqueData data;

  const ReliefRateScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TOP_BARS.RELIEF, // Insert header here
        body: Container(
          alignment: Alignment.center,
          color: AppColors.bg,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: RatingSection(data: data),
          ),
        ));
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

  double getRatingValue() {
    return _value;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 75),
        Text("How effective was ${widget.data.activityName}?",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 30,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.bold,
              )),
        SizedBox(height: 25),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: 302,
          constraints: BoxConstraints(minHeight: 302, minWidth: 300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(blurRadius: 10,
              spreadRadius: 1,
              color: AppColors.black.withOpacity(0.25)),
            ],
          ),
          child: Padding (
            padding: EdgeInsets.all(20),
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            
            Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                    LikertScaleButton<double>(
                        value: 1,
                        groupValue: _value,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        grad: AppGrads.secondLowest),
                    LikertScaleButton<double>(
                        value: 2,
                        groupValue: _value,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        grad: AppGrads.lowest),
                    LikertScaleButton<double>(
                        value: 3,
                        groupValue: _value,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        grad: AppGrads.medium),
                    LikertScaleButton<double>(
                        value: 4,
                        groupValue: _value,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        grad: AppGrads.secondHighest),
                    LikertScaleButton<double>(
                        value: 5,
                        groupValue: _value,
                        onChanged: (double value) {
                          setState(() {
                            _value = value;
                          });
                        },
                        grad: AppGrads.highest)
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Poor",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.font,
                          fontSize: 20,
                          fontFamily: 'MainFont',
                          fontWeight: FontWeight.w500,
                        )),
                        Text("Great",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: AppColors.font,
                          fontSize: 20,
                          fontFamily: 'MainFont',
                          fontWeight: FontWeight.w500,
                        ))
                    ],
                    
                  ),
              ])),
          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(child: FavoriteButton(data: widget.data))),
          Padding(
            child: RateButton(data: widget.data, getRatingValue: getRatingValue),
            padding: const EdgeInsets.all(25),
          ),
        ])
        ))
      
      ],
    );
  }
}

class RateButton extends StatelessWidget {
  final ReliefTechniqueData data;
  Function getRatingValue;
  RateButton({Key? key, required this.data, required this.getRatingValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: AppGrads.mainGreen,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                spreadRadius: 1,
                color: AppColors.black.withOpacity(0.3),
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: ElevatedButton(
              onPressed: () {
                data.addRating(getRatingValue());
                DataStorage.updateReliefTechniqueData(data);
                DataStorage.saveToDisk();
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("Rate",
                  style: TextStyle(
                    color: AppColors.font,
                    fontFamily: 'MainFont',
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                  )),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)))),
        ));
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
    super.initState();
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
    DataStorage.saveToDisk();
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
    return Row(mainAxisAlignment: MainAxisAlignment.end, children: [
      Text(_text,
          style: TextStyle(
            color: AppColors.font,
            fontFamily: 'MainFont',
            fontWeight: FontWeight.normal,
            fontSize: 20,
          )),
      IconButton(
          onPressed: flipFavorite,
          icon: Icon(
            _iconData,
            size: 30,
            color: Color.fromARGB(255, 253, 188, 103),
          )),
    ]);
  }
}
