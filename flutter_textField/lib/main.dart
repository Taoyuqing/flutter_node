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
  Map<String, TextEditingController> _textFieldController = {};
  Map<String, FocusNode> _textFocusNode = {};
  Map<String, Widget> _textField = {};
  List<Widget> _textFieldList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _strList.add("value");
                  });
                },
                child: Text('add'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _createTextField() {
    for (var i = 0; i < _strList.length; i++) {
      _textFieldController.putIfAbsent('editingController$i',
          () => TextEditingController(text: _strList[i]));
      _textFocusNode.putIfAbsent('focusNode$i', () => FocusNode());
      _textField.putIfAbsent(
        'textInput$i',
        () => Container(
          width: 200,
          height: 40,
          margin: EdgeInsets.only(top: 10),
          child: TextField(
            readOnly: true,
            showCursor: true,
            focusNode: _textFocusNode['focusNode$i'],
            controller: _textFieldController['editingController$i'],
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.account_circle),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              labelText: _strList[i],
              labelStyle: TextStyle(fontSize: 12.0),
              hintText: _strList[i],
              hintStyle: TextStyle(fontSize: 12.0),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      );
    }
    List<String> keys = _textField.keys.toList();

    for (var i = 0; i < keys.length; i++) {
      if (_textFieldList.length == 0 ||
          !_textFieldList.contains(_textField['textInput$i'])) {
            print('object'*10);
            _textFieldList.add(_textField['textInput$i']);
          }
    }
    return _textFieldList;
  }
}
