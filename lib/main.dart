import 'package:flutter/material.dart';
import 'package:relieflink/nav.dart';
import 'package:relieflink/top.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: const TopBar(),
      body: SafeArea(child: Nav()),
    );
  }
}

class TopBar extends StatelessWidget implements PreferredSizeWidget{
  @override
    final Size preferredSize; // default is 56.0
  
  const TopBar({ Key? key }) : preferredSize=const Size(75, 75), super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(
          child: RichText(
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
        ),
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
        toolbarHeight: 80,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: ElevatedButton(
              child: const Icon(Icons.phone_outlined, size: 30, color: Color.fromRGBO(255,255,255,1),),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(60,60),
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
          ),
        ],
      );
  }
}