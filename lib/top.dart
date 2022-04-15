import 'package:flutter/material.dart';

class Top_Relief extends StatelessWidget {
  const Top_Relief({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          textAlign: TextAlign.left,
          text: TextSpan(
              text: "Relief Techniques\n",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 1)
              ),
              children: <TextSpan>[
                TextSpan(
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
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        toolbarHeight: 75,
        actions: <Widget>[
          ElevatedButton(
            child: Icon(Icons.phone_outlined, size: 45, color: Color.fromRGBO(255,255,255,1),),
            style: ElevatedButton.styleFrom(
              //fixedSize: Size(75,75),
              primary: Color.fromRGBO(230,81,86,1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft:Radius.circular(10.0),
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
                    insetPadding: EdgeInsets.only(left: 100, top: 250, right: 100, bottom: 250),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    content: Column(
                        children: <Widget>[
                          Text("Call for emergency?"),
                          SizedBox(height: 20,),
                          Row(
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Icon(Icons.close),
                                onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                              ),
                              SizedBox(width: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                ),
                                child: Icon(Icons.check),
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
      body: Center(
        child: Text(
          'Top_relief',
          style: TextStyle(fontSize: 24),
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
          text: TextSpan(
              text: "Emergency Contacts\n",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(0, 0, 0, 1)
              ),
              children: <TextSpan>[
                TextSpan(
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
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        toolbarHeight: 75,
        actions: <Widget>[
          ElevatedButton(
            child: Icon(Icons.phone_outlined, size: 45, color: Color.fromRGBO(255,255,255,1),),
            style: ElevatedButton.styleFrom(
              //fixedSize: Size(75,75),
              primary: Color.fromRGBO(230,81,86,1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                  bottomLeft:Radius.circular(10.0),
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
                    insetPadding: EdgeInsets.only(left: 100, top: 250, right: 100, bottom: 250),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    content: Column(
                      children: <Widget>[
                        Text("Call for emergency?"),
                        SizedBox(height: 20,),
                        Row(
                            children: <Widget>[
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.red,
                                ),
                                child: Icon(Icons.close),
                                onPressed: () => Navigator.of(context, rootNavigator: true).pop('dialog'),
                              ),
                              SizedBox(width: 30),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.green,
                                ),
                                child: Icon(Icons.check),
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
      body: Center(
        child: Text(
          'Top_Emergency',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

