import 'package:flutter/material.dart';
import 'package:relieflink/screens/NavigationWrapper.dart';
import 'package:relieflink/utils/constants.dart';

class Top_Relief extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // default is 56.0

  const Top_Relief({Key? key})
      : preferredSize = const Size(75, 75),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    const black = AppColors.black;
    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      elevation: 10,
      title: Center(
        child: RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
              text: "Relief Techniques\n",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text:
                      'You can choose what you prefer, or sort by time and mood',
                  style: TextStyle(
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
            child: const Icon(
              Icons.phone_outlined,
              size: 30,
              color: AppColors.white,
            ),
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(60, 60),
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
                        const Text("Call for emergency?"),
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
                                      Navigator.of(context, rootNavigator: true)
                                          .pop('dialog'),
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

class Top_emergency extends StatelessWidget {
  const Top_emergency({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
              text: "Emergency Contacts\n",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
              children: <TextSpan>[
                TextSpan(
                  text: 'Remember to reach out to those you love and care for',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                ),
              ]),
        ),
        //titleSpacing: 10,
        backgroundColor: AppColors.black,
        toolbarHeight: 75,
        actions: <Widget>[
          ElevatedButton(
            child: const Icon(
              Icons.phone_outlined,
              size: 45,
              color: AppColors.white,
            ),
            style: ElevatedButton.styleFrom(
              //fixedSize: Size(75,75),
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
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.only(
                        left: 100, top: 250, right: 100, bottom: 250),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    content: Column(
                      children: <Widget>[
                        const Text("Call for emergency?"),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(children: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
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
                                Navigator.of(context, rootNavigator: true)
                                    .pop('dialog'),
                          ),
                        ]),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Top_Emergency',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
