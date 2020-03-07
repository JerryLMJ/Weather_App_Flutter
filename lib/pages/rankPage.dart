import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import './detailPage.dart';
import '../net/httpUtil.dart';
import '../model/rank_model.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> with AutomaticKeepAliveClientMixin {

  var rankList = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    try {
      var response = await HttpUtil('https://air-quality.com').get('/data/get_ranking');
      Map dataMap = json.decode(response.toString());
      List ranks = dataMap['data']['rank'];
      var rankData = [];
      for (var r in ranks) {
        RankItemModel item = RankItemModel.fromJson(r);
        rankData.add(item);
      }

      setState(() {
        rankList = rankData;
      });

    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: EasyRefresh(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () { 
            loadData();
          });
        },
        child: ListView.separated(
          itemCount: rankList.length,
          itemBuilder: rankListItemView,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 1.0, 
              color: Colors.grey
              );
          },
        )
      )
    );
  }

  Widget rankListItemView(BuildContext context, int index) {
    RankItemModel model = rankList[index];
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
      child: GestureDetector(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  '${model.index}',
                  style: TextStyle(
                    color: Colors.grey,
                    height: 1.2,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                  ),
                ),
                Container(
                  width: 15,
                ),
                Text(
                  '${model.place}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    height: 1.2,
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                  ),
                ),
              ],
            ),
            Container(
              width: 60,
              height: 26,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(
                  Radius.circular(4)
                )
              ),
              child: Text(
                '${model.value}',
                style: TextStyle(
                  color: Colors.white,
                  height: 1.2,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              )
            )
          ],
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title: model.place)));
        }
      )
    );
  }
}