  
  String getWeatherImg(String weather) {
    switch (weather) {
      case '晴':
        return 'images/weather_qing.svg';

      case '少云':
      case '多云':
        return 'images/weather_duoyun.svg';

      case '阴':
        return 'images/weather_yintian.svg'; // 阴天
     
      case '毛毛雨/细雨':
      case '小雨':
      case '小到中雨':
        return 'images/weather_xiaoyu.svg';

      case '中雨':
      case '中到大雨':
        return 'images/weather_zhongyu.svg';

      case '大雨':
      case '大到暴雨':
        return 'images/weather_dayu.svg';

      case '极端降雨':
      case '暴雨':
      case '大暴雨':
      case '特大暴雨':
      case '暴雨到大暴雨':
      case '大暴雨到特大暴雨':
        return 'images/weather_baoyu.svg'; // 暴雨

      case '雷阵雨':
      case '强雷阵雨':
      case '雷阵雨伴有冰雹':
        return 'images/weather_leiyu.svg'; // 雷雨
      
      case '':
        return 'images/weather_xiaoyuzhuanqing.svg'; // 小雨转晴


      case '冻雨':
      case '雷阵雨伴有冰雹':
        return 'images/weather_bingbao.svg'; // 冰雹

      case '雨夹雪':
      case '雨雪天气':
      case '阵雨夹雪':
        return 'images/weather_yujiaxue.svg'; // 雨夹雪


      case '阵雪':
        return 'images/weather_xuezhuanqing.svg'; // 雪转晴


      case '雪':
      case '小雪':
      case '小到中雪':
        return 'images/weather_xiaoxue.svg';

      case '中雪':
      case '中到大雪':
        return 'images/weather_zhongxue.svg';

      case '大雪':
      case '大到暴雪':
        return 'images/weather_daxue.svg';


      case '扬沙':
      case '浮尘':
      case '沙尘暴':
      case '强沙尘暴':
        return 'images/weather_shachen.svg'; // 沙尘

      // case '':
      //   return 'images/weather_shuang.svg'; // 霜

      case '薄雾':
      case '雾':
      case '大雾':
      case '浓雾':
      case '强浓雾':
      case '特强浓雾':
      case '霾':
      case '中度霾':
      case '重度霾':
      case '严重霾':
        return 'images/weather_wumai.svg'; // 雾霾
      
      // case '':
      //   return 'images/weather_ye.svg'; // 夜

      // case '':
      //   return 'images/weather_yeduoyun.svg'; // 夜多云

      default:
        return '';
    
    }
  }