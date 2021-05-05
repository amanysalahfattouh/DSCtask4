import 'package:flutter/material.dart';
import 'package:task4/pages/Home.dart';
import 'package:task4/pages/bottom.dart';
import 'package:task4/pages/profile.dart';
import 'package:task4/pages/setting.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Floating',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Float'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _cIndex = 0;

  List<Widget> _Screens =<Widget>[
    Home(),
    Profile(),
    Bottom(),
    Setting()
  ];

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('BottomAppBar with FAB'),
      ),
      body: new Center(

        child: _Screens.elementAt(_cIndex),
      ),
      bottomNavigationBar:BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed ,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: _cIndex ==0? Colors.blue : Colors.grey),
              title: new Text('Home')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: _cIndex ==1? Colors.blue : Colors.grey),
              title: new Text('Profile')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.border_bottom,color: _cIndex ==2? Colors.blue : Colors.grey),
              title: new Text('Bottom')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings,color: _cIndex ==3? Colors.blue : Colors.grey),
              title: new Text('Setting')
          ),
        ],
        onTap: _incrementTab,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: new FloatingActionButton(

       // onPressed:(){ _incrementTab(1); },
      //  tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}