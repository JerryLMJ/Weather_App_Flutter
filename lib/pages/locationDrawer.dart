import 'dart:convert';

import 'package:flutter/material.dart';

import '../model/location_model.dart';
import '../net/httpUtil.dart';


class LocationDrawer extends StatefulWidget {
  @override
  _LocationDrawerState createState() => _LocationDrawerState();
}

class _LocationDrawerState extends State<LocationDrawer> {
  var locationList = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      var response = await HttpUtil('https://search.heweather.net').get('/top?group=cn&number=10&key=4509facd23334126b72d34818b2ef38a');
      Map dataMap = json.decode(response.toString());
      List locationData = dataMap['HeWeather6'][0]['basic'];
      var locations = [];
      for (var l in locationData) {
        LocationModel model = LocationModel.fromJson(l);
        locations.add(model);
      }

      setState(() {
        locationList = locations;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 100,
              child:  DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xff113076)
                ),
                child: Text(
                  "热门城市",
                  style: TextStyle(
                    height: 1.2,
                    color: Colors.green
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(0),
                itemCount: locationList.length,
                itemBuilder: listItem,
              ),
            )
          ],
        ) 
      )
    );
  }

  Widget listItem(BuildContext context, int index) {
    LocationModel model = locationList[index];
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 15, 0, 15), 
      child: Row(
        children: <Widget>[
          Text(
            '${model.location}',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Colors.grey,
              height: 1.2,
              fontSize: 16,
              fontWeight: FontWeight.w500
            ),
          ),

        ],
      )
    );
  }
}