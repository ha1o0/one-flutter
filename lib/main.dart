import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'FunctionPage.dart';

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
      body: _buildSuggestions(),
    );
  }

}