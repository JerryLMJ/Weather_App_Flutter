import 'package:flutter/material.dart';


class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {

  @override
  Widget build(BuildContext context){
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff113076),
            Color(0xff157FBA),
          ]),
      ),
      child: Column(
        children: <Widget>[
          topBox(),
          bottomBox()
        ],
      )
    );
  }

  Widget topBox() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      decoration: BoxDecoration(
        color: Color(0x22ffffff),
        borderRadius: BorderRadius.all(
          Radius.circular(5)
        ),
        // boxShadow: [
        //   BoxShadow(color: Color(0x33000000), blurRadius: 4.0, spreadRadius: 0),
        //   BoxShadow(color: Color(0xFF113076), blurRadius: 0, spreadRadius: 0),
        // ]
      ),
      child: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '-10°',
                style: TextStyle(
                  color: Colors.white,
                  height: 1,
                  fontSize: 56,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '晴朗',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.2,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              
            ]
          )
        ],
      )
    );
  }

  Widget bottomBox() {
    return  Container(
      margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '北京 今天天气',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              height: 1,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(),
        ],
      ),
    );
  }
}