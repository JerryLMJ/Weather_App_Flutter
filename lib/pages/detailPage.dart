import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final String title;
  @override
  _DetailPageState createState() => _DetailPageState(title: title);

  DetailPage({this.title});
}

class _DetailPageState extends State<DetailPage> {
  final String title;

  _DetailPageState({this.title});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(title),
      ),
    );
  }
}