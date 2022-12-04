import 'package:flutter/material.dart';
import 'package:relieflink/screens/NavigationWrapper.dart';
import 'package:relieflink/utils/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class TopBars extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // default is 56.0
  final String mainText;
  final String descriptiveText;

  const TopBars(
      {Key? key, required this.mainText, required this.descriptiveText})
      : preferredSize = const Size(75, 75),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    const black = AppColors.black;
    return AppBar(
      iconTheme: const IconThemeData(color: AppColors.font),
      elevation: 10,
      title: Container(
        child: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text: mainText + '\n',
              style: TextStyle(
                fontFamily: 'MainFont',
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: descriptiveText,
                  style: TextStyle(
                    fontFamily: 'MainFont',
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                ),
              ]),
        ),
      ),
      backgroundColor: AppColors.bg,
      toolbarHeight: 80,
      actions: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(
              child: Column(
                children: const <Widget> [
                  Icon(Icons.phone_outlined,
                    size: 34,
                    color: AppColors.white,
                ),
                  Text("Call 988",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                      wordSpacing: 1,
                ),
                    softWrap: false,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(80, 80),
                primary: AppColors.red2,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                  side: BorderSide(color: Colors.transparent),
              ),
              padding: EdgeInsets.zero,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.only(
                        left: 50, top: 250, right: 50, bottom: 250),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        const Text("Call 988, the Suicide \n& Crisis Lifeline?"),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    // TODO: Change those colors into chosen colors by designer
                                    primary: Colors.red,
                                  ),
                                  child: const Icon(Icons.close),
                                  onPressed: () =>
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog'),
                                ),
                                const SizedBox(width: 30),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                  ),
                                  child: const Icon(Icons.check),
                                  //TODO: call actual contacts
                                  onPressed: () =>
                                      launchUrl(Uri.parse("tel://988")),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

class TOP_BARS {
  static const RELIEF_MAIN = TopBars(
    mainText: 'Relief Techniques',
    descriptiveText: 'Browse all relief activities',
  );
  static const RELIEF = TopBars(
    mainText: 'Relief Technique',
    descriptiveText: 'Enjoy your activity!',
  );
  static const ONBOARDING = TopBars(
    mainText: 'Welcome to ReliefLink',
    descriptiveText: 'We are here to help',
  );
  static const DIARY = TopBars(
    mainText: 'Diary',
    descriptiveText: 'Write down how you feel',
  );
  static const CONTACTS = TopBars(
    mainText: 'Emergency Contacts',
    descriptiveText: 'Manage your emergency contacts',
  );
  static const ME = TopBars(
    mainText: 'Me',
    descriptiveText: 'Manage your app and find extra resources',
  );
  static const CRISIS = TopBars(
    mainText: 'Crisis Plan',
    descriptiveText: 'Manage your crisis plan',
  );
}
