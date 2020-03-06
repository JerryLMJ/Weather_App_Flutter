import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

import '../net/httpUtil.dart';
import '../model/weather_model.dart';
import '../utils/wetherImgHelper.dart';

class OverviewPage extends StatefulWidget {
  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> with AutomaticKeepAliveClientMixin {
  WeathierBasicModel basicModel = WeathierBasicModel();
  WeathierNowModel nowModel = WeathierNowModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      var response = await HttpUtil(0).get('/weather/now?location=beijing&key=4509facd23334126b72d34818b2ef38a');
      Map dataMap = json.decode(response.toString());
      Map weatherData = dataMap['HeWeather6'][0];
      var weatherBasicModel = WeathierBasicModel.fromJson(weatherData['basic']);
      var weatherNowModel = WeathierNowModel.fromJson(weatherData['now']);
      
      setState(() {
        basicModel = weatherBasicModel;
        nowModel = weatherNowModel;
      });
    } catch (e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context){
    super.build(context);

    return Container(
      decoration: BoxDecoration(
        gradient: new LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff113076),
            Color(0xff157FBA),
          ]),
      ),
      child: EasyRefresh(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () { 
            getData();
          });
        },
        child: Column(
          children: <Widget>[
            topBox(),
            bottomBox()
          ],
        ),
      )
    );
  }

  Widget topBox() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '${nowModel.tmp}°',
                style: TextStyle(
                  color: Colors.white,
                  height: 1,
                  fontSize: 56,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '${nowModel.cond_txt}',
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
              SizedBox(
                width: 60,
                height: 60,
                child: SvgPicture.asset(getWeatherImg(nowModel.cond_txt))
              ),
              Text(
                '--/${nowModel.fl}°', 
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600
                ),
              )
            ]
          )
        ],
      )
    );
  }

  Widget bottomBox() {
    return  Container(
      margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
      padding: EdgeInsets.fromLTRB(20, 25, 20, 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(5)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text(
              '${basicModel.admin_area} 今天天气',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.black,
                height: 1,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          list("images/list_qiwen.png", "高 / 低", "--/${nowModel.fl}°"),
          Divider(height:2.0,indent:0.0,color: Color(0xffDEDEDE)),
          list("images/list_fengli.png", '${nowModel.wind_dir}', "${nowModel.wind_sc} 级"),
          Divider(height:2.0,indent:0.0,color: Color(0xffDEDEDE)),
          list("images/list_shidu.png", "湿度", "${nowModel.hum}%"),
          Divider(height:2.0,indent:0.0,color: Color(0xffDEDEDE)),
          list("images/list_ludian.png", "露点", "-16°"),
          Divider(height:2.0,indent:0.0,color: Color(0xffDEDEDE)),
          list("images/list_qiya.png", "气压", "↑ ${nowModel.pres} 毫巴"),
          Divider(height:2.0,indent:0.0,color: Color(0xffDEDEDE)),
          list("images/list_ziwaixian.png", "紫外线", "0（最大值10）"),
          Divider(height:2.0,indent:0.0,color: Color(0xffDEDEDE)),
          list("images/list_nengjiandu.png", "能见度", "${nowModel.vis} 公里"),
          Divider(height:2.0,indent:0.0,color: Color(0xffDEDEDE)),
          list("images/list_yuexiang.png", "月相", "亏凸月"),
        ],
      ),
    );
  }

  Widget list(String pic, String title, String value) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 24,
                height: 24,
                child: Image.asset(pic),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  title, 
                  style: TextStyle(
                    color: Color(0xff2b2b2b),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          Text(
            value,
            style: TextStyle(
              color: Color(0xff2b2b2b),
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}