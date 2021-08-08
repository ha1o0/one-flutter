import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = new WordPair.random();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Startup Name Generator',
      // home: new RandomWords(),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => new FunctionPage(),
        '/first': (BuildContext context) => new RandomWords(),
      },
    );
  }
}

class FunctionPage extends StatefulWidget {
  const FunctionPage({ Key? key }): super(key: key);

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

  Image getTabImage(path) {
    return new Image.asset(path, width: 24.0, height: 24.0);
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == _selectIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  void initData() {
    tabImages = [
      [getTabImage('images/world.png'), getTabImage('images/world-selected.png')],
      [getTabImage('images/user.png'), getTabImage('images/user-selected.png')],
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('bbbbb'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.lightBlue,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: getTabIcon(0), label: '世界'),
            BottomNavigationBarItem(icon: getTabIcon(1), label: '我的'),
          ],
          currentIndex: _selectIndex,
          iconSize: 24.0,
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

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) {
            return new Divider();
          }
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    return new ListTile(
      title: new Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      onTap: () {
        print(wordPair.asPascalCase);
        Navigator.of(context).pushNamed('/first');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('aaaaaa'),
      ),
      body: _buildSuggestions(),
    );
  }

}