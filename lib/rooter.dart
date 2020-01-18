import 'package:flutter/material.dart';

import './pages/overviewPage.dart';
import './pages/rankPage.dart';

class Rooter extends StatefulWidget {
  @override
  _RooterState createState() => _RooterState();
}

class _RooterState extends State<Rooter> {
    int _selecteIndex = 0;

    final titles = ['概览', '排行榜'];
    final pages = [OverviewPage(), RankPage()];

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(titles[_selecteIndex]),
          actions: _selecteIndex == 0 ? <Widget>[
            IconButton(icon: Icon(Icons.share), onPressed: () {}),
          ] : <Widget>[],
        ),
        drawer: Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('概览')),
            BottomNavigationBarItem(icon: Icon(Icons.business), title: Text('排行榜')),
          ],
          currentIndex: _selecteIndex,
          onTap: _onItemTapped,
          fixedColor: Theme.of(context).primaryColor,
        ),
        body: IndexedStack(
          index: _selecteIndex,
          children: pages,
        ),
      );
    }

    void _onItemTapped(int index) {
      setState(() {
        _selecteIndex = index;
      });
    }
}
