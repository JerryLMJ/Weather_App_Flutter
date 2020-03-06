class LocationModel {
      String cid;
      String location;
      String parentCity;
      String adminArea;
      String cnty;
      String lat;
      String lon;
      String tz;
      String type;

      LocationModel({this.cid, this.location, this.parentCity, this.adminArea, this.cnty, this.lat, this.lon, this.type, this.tz});

      LocationModel.fromJson(Map<String, dynamic> json) {
        cid = json['cid'];
        location = json['location'];
        parentCity = json['parent_city'];
        adminArea = json['admin_area'];
        cnty = json['cnty'];
        lat = json['lat'];
        lon = json['lon'];
        tz = json['tz'];
        type = json['type'];
      }

      Map<String, dynamic> toJson() {
        final Map<String, dynamic> map = new Map<String, dynamic>();
        map['cid'] = this.cid;
        map['location'] = this.location;
        map['parent_city'] = this.parentCity;
        map['admin_area'] = this.adminArea;
        map['cnty'] = this.cnty;
        map['lat'] = this.lat;
        map['lon'] = this.lon;
        map['tz'] = this.tz;
        map['type'] = this.type;
        return map;
      }
}