import 'dart:math';

import 'package:flutter/material.dart';
import 'package:relieflink/utils/constants.dart';

import '../../screens/ReliefHomeScreen.dart';
import '../ReliefActivity/ReliefRateScreen.dart';
import '../ReliefActivity/ReliefScreen.dart';
import '../../utils/relief_technique_utils.dart';
import '../../utils/data_storage.dart';

class ActivityButton extends StatefulWidget {
  final ReliefTechniqueData activity;
  final Function updateParent;
  const ActivityButton(
      {Key? key, required this.activity, required this.updateParent})
      : super(key: key);

  @override
  State<ActivityButton> createState() => _ActivityButtonState();
}

class _ActivityButtonState extends State<ActivityButton> {
  IconData iconData = Icons.star;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    LinearGradient grad = AppConstants.getGradByMood(widget.activity.mood);
    Color color = AppConstants.getColorByMood(widget.activity.mood);

    String name = widget.activity.activityName;
    Moods mood = Moods.values.firstWhere((element) =>
        element.toShortString().toLowerCase() ==
        widget.activity.mood.toLowerCase());

    int duration = widget.activity.duration;
    String URL = widget.activity.videoLink;
    ValueKey key = ValueKey(0);

    const double radius = 10;
    double buttonMinHeight = 130;
    double buttonMaxHeight = 300;

    setState(() {
      iconData = widget.activity.favorite ? Icons.star : Icons.star_outline;
    });

    ElevatedButton button = ElevatedButton(
      onPressed: () {
        Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ReliefScreen(data: widget.activity)))
            .then((success) => widget.updateParent())
            .then((success) => setState(() {}));
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(AppColors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(radius))),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(0)),
          alignment: Alignment.topLeft),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            key: key,
            decoration: BoxDecoration(
              gradient: grad,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(radius),
                topLeft: Radius.circular(radius),
              ),
            ),
            height: buttonMinHeight * 0.3,
            child: Container(
              alignment: Alignment.centerRight,
              child: IconButton(
                  onPressed: () async => {
                        await DataStorage.init(),
                        showDialog<void>(
                            context: context,
                            barrierDismissible: false, // user must tap button!
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Row(
                                  children: const [
                                    BackButton(),
                                    Text('Edit Relief Technique',
                                        style: TextStyle(
                                          color: AppColors.font,
                                          fontFamily: 'MainFont',
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        )),
                                  ],
                                ),
                                content: SingleChildScrollView(
                                    child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Form(
                                      key: _formKey,
                                      child: Column(
                                        children: [
                                          TextFormField(
                                            initialValue: name,
                                            style: const TextStyle(
                                              color: AppColors.font,
                                              fontFamily: 'MainFont',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                            decoration: const InputDecoration(
                                                hintText:
                                                    'Enter the name of the Relief Activity',
                                                labelText: 'Name',
                                                labelStyle: TextStyle(
                                                  color: AppColors.font,
                                                  fontFamily: 'MainFont',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                )),
                                            onSaved: (String? value) {
                                              name =
                                                  value ?? 'Activity\'s name';
                                            },
                                          ),
                                          DropdownButtonFormField(
                                            items: Moods.values
                                                .map((a) => DropdownMenuItem(
                                                      child: Text(
                                                          a.toShortString()),
                                                      value: a,
                                                    ))
                                                .toList(),
                                            style: const TextStyle(
                                              color: AppColors.font,
                                              fontFamily: 'MainFont',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                            decoration: const InputDecoration(
                                                hintText:
                                                    'Enter the mood for this activity',
                                                labelText: 'Activity`s mood',
                                                labelStyle: TextStyle(
                                                  color: AppColors.font,
                                                  fontFamily: 'MainFont',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                )),
                                            onChanged: (Moods? value) {
                                              mood = value ?? Moods.OTHER;
                                            },
                                          ),
                                          TextFormField(
                                            keyboardType: TextInputType.number,
                                            initialValue: duration.toString(),
                                            style: const TextStyle(
                                              color: AppColors.font,
                                              fontFamily: 'MainFont',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                            decoration: const InputDecoration(
                                                hintText:
                                                    'Enter the duration of the Activity',
                                                labelText: 'Duration',
                                                labelStyle: TextStyle(
                                                  color: AppColors.font,
                                                  fontFamily: 'MainFont',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                )),
                                            onSaved: (String? value) {
                                              duration =
                                                  int.parse(value ?? '0');
                                            },
                                          ),
                                          TextFormField(
                                            initialValue: URL,
                                            style: const TextStyle(
                                              color: AppColors.font,
                                              fontFamily: 'MainFont',
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18,
                                            ),
                                            decoration: const InputDecoration(
                                                hintText:
                                                    'Enter the URL of the video of the Activity',
                                                labelText: 'URL',
                                                labelStyle: TextStyle(
                                                  color: AppColors.font,
                                                  fontFamily: 'MainFont',
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 17,
                                                )),
                                            onSaved: (String? value) {
                                              URL = value ?? 'Activity\'s URL';
                                            },
                                          ),
                                        ],
                                      )),
                                )),
                                actions: <Widget>[
                                  TextButton(
                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                        color: AppColors.red,
                                        fontFamily: 'MainFont',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                    onPressed: () async {
                                      await DataStorage.init();
                                      DataStorage.removeReliefTechnique(name);
                                      DataStorage.saveToDisk();
                                      widget.updateParent();
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: const Text(
                                      'Save',
                                      style: TextStyle(
                                        color: AppColors.black,
                                        fontFamily: 'MainFont',
                                        fontWeight: FontWeight.w800,
                                        fontSize: 18,
                                      ),
                                    ),
                                    onPressed: () async {
                                      _formKey.currentState!.save();
                                      if (name != '' &&
                                          URL != '' &&
                                          duration > 0) {
                                        await DataStorage.init();
                                        DataStorage.updateReliefTechniqueData(
                                            ReliefTechniqueData(
                                                activityName: name,
                                                mood: mood
                                                    .toShortString()
                                                    .toLowerCase(),
                                                videoLink: URL,
                                                duration: duration,
                                                favorite:
                                                    widget.activity.favorite));
                                        DataStorage.saveToDisk();
                                        widget.updateParent();
                                      }
                                      setState(() {
                                        key = ValueKey(Random().nextInt(100));
                                      });
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            })
                      },
                  icon: Icon(
                    Icons.edit_note_rounded,
                    color: AppColors.black,
                  )),
            ),
          ),
          const Spacer(),
          Text(widget.activity.activityName,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.font,
                fontFamily: 'MainFont',
                fontWeight: FontWeight.w800,
                fontSize: 17,
              )),
          Text('${widget.activity.duration} min',
              style: const TextStyle(
                  color: AppColors.font,
                  fontFamily: 'MainFont',
                  fontWeight: FontWeight.w200,
                  fontSize: 16)),
          IconButton(
              color: AppColors.font,
              onPressed: () {
                widget.activity.toggleActivityFavorite();
                setState(() {
                  iconData =
                      iconData == Icons.star ? Icons.star_outline : Icons.star;
                });
                DataStorage.updateReliefTechniqueData(widget.activity);
                DataStorage.saveToDisk();
                widget.updateParent();
              },
              icon: Icon(
                iconData,
                size: 20,
              )),
        ],
      ),
    );

    return Container(child: button);
  }
}
