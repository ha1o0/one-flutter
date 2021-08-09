import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class FunctionPage extends StatefulWidget {
  // const FunctionPage({ Key? key }): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new FunctionState();
  }
}

class FunctionState extends State<FunctionPage> {

  int _selectIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    RandomWords(),
    RandomWords(),
  ];
  var tabImages;

  Image getTabImage(path, { color, width = 28.0, height = 28.0}) {
    if (color != null) {
      return new Image.asset(path, width: width, height: height, color: color);
    }
    return new Image.asset(path, width: width, height: height);
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _selectIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  void initData() {
    tabImages = [
      [getTabImage('images/world.png', color: Colors.black26), getTabImage('images/world.png', color: Colors.lightBlue)],
      [getTabImage('images/user.png', color: Colors.black26), getTabImage('images/user.png', color: Colors.lightBlue)],
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('bbbbb'),
        backgroundColor: Colors.lightBlue,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            unselectedFontSize: 12.0,
            selectedFontSize: 12.0,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: getTabIcon(0), label: '世界'),
              BottomNavigationBarItem(icon: getTabIcon(1), label: '我的'),
            ],
            currentIndex: _selectIndex,
            iconSize: 32.0,
            onTap: (index) {
              setState(() {
                _selectIndex = index;
              });
            },
          ),
        ),
    );
  }
}