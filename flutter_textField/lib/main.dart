import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _strList = ["your name", "your age", "your phone number"];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: ListView(
            children: [
              Column(
                children: _createTextField(),
              ),
              RaisedButton(onPressed: (){
                setState(() {
                  _strList.add("value");
                });
              },child: Text('add'),)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _createTextField() {
    return _strList.map((e) {
      return Container(
        width: 200,
        height: 40,
        margin: EdgeInsets.only(top: 10),
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            labelText: e,
            labelStyle: TextStyle(fontSize: 12.0),
            hintText: e,
            hintStyle: TextStyle(fontSize: 12.0),
            border: OutlineInputBorder(),
          ),
        ),
      );
    }).toList();
  }
}
