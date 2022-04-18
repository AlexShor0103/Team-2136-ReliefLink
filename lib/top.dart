import 'package:flutter/material.dart';
import 'package:relieflink/nav.dart';

class Top_Relief extends StatelessWidget {
  const Top_Relief({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
              text: "Relief Techniques\n",
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 1)
              ),
              children: <TextSpan>[
                const TextSpan(
                  text: 'You can choose what you prefer, or sort by time and mood',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ]
            ),
          ),
        //titleSpacing: 10,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        toolbarHeight: 75,
        actions: <Widget>[
          ElevatedButton(
            child: const Icon(Icons.phone_outlined, size: 45, color: Color.fromRGBO(255,255,255,1),),
            style: ElevatedButton.styleFrom(
              //fixedSize: Size(75,75),
              primary: const Color.fromRGBO(230,81,86,1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: const Radius.circular(10.0),
                  bottomLeft:Radius.circular(10.0),
                  bottomRight: const Radius.circular(10.0),
                ),
                side: BorderSide(color: Colors.transparent),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.only(left: 100, top: 250, right: 100, bottom: 250),
                    shape: const RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0))
                    ),
                    content: Column(
                        children: <Widget>[
                          const Text("Call for emergency?"),
                          const SizedBox(height: 20,),
                          Row(
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: const Icon(Icons.close),
                                onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                ),
                                child: const Icon(Icons.check),
                                //TODO: call actual contacts
                                onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                              ),
                            ]
                          ),
                        ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [Container(
            child: Text(
              'Top_reliefz',
              style: TextStyle(fontSize: 24),
            ),
          )],
        ),
      ),
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
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 1)
              ),
              children: <TextSpan>[
                const TextSpan(
                  text: 'Remember to reach out to those you love and care for',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ]
          ),
        ),
        //titleSpacing: 10,
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        toolbarHeight: 75,
        actions: <Widget>[
          ElevatedButton(
            child: const Icon(Icons.phone_outlined, size: 45, color: Color.fromRGBO(255,255,255,1),),
            style: ElevatedButton.styleFrom(
              //fixedSize: Size(75,75),
              primary: const Color.fromRGBO(230,81,86,1),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft:Radius.circular(10.0),
                  bottomRight: const Radius.circular(10.0),
                ),
                side: BorderSide(color: Colors.transparent),
              ),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    insetPadding: const EdgeInsets.only(left: 100, top: 250, right: 100, bottom: 250),
                    shape: const RoundedRectangleBorder(
                        borderRadius: const BorderRadius.all(const Radius.circular(10.0))
                    ),
                    content: Column(
                      children: <Widget>[
                        const Text("Call for emergency?"),
                        const SizedBox(height: 20,),
                        Row(
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: const Icon(Icons.close),
                                onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                child: const Icon(Icons.check),
                                //TODO: call actual contacts
                                onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                              ),
                            ]
                        ),
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
        child: const Text(
          'Top_Emergency',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

