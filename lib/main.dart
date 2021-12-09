import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(key: UniqueKey(), title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title = ""}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Widget> _myColorWidgets = [
    Container(
        child: RandomColorWidget(
      key: UniqueKey(),
    )),
    RandomColorWidget(key: UniqueKey()),
  ];

  void _reverseList() {
    setState(() {
      var temp = _myColorWidgets[0];
      _myColorWidgets[0] = _myColorWidgets[1];
      _myColorWidgets[1] = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'My colored widgets: ',
            ),
            ..._myColorWidgets
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _reverseList,
        tooltip: 'Reverse',
        child: const Icon(Icons.swap_vert),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_vert),
            label: "Swap vert"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: "Swap horiz"
          ),
        ],
      ),
    );
  }
}

class StatelessColorWidget extends StatelessWidget {
  final Color color;

  const StatelessColorWidget({Key? key, this.color = Colors.transparent})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 40,
      color: color,
    );
  }
}

class RandomColorWidget extends StatefulWidget {
  const RandomColorWidget({Key? key}) : super(key: key);

  @override
  _RandomColorWidgetState createState() => _RandomColorWidgetState();
}

class _RandomColorWidgetState extends State<RandomColorWidget> {
  late Color currentColor;

  @override
  void initState() {
    var rnd = Random();
    currentColor =
        Color.fromRGBO(rnd.nextInt(256), rnd.nextInt(256), rnd.nextInt(256), 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StatelessColorWidget(
      color: currentColor,
    );
  }
}
