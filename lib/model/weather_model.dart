class WeathierBasicModel {
  String cid;
  String location;
  String parent_city;
  String admin_area;
  String cnty;
  String lat;
  String lon;
  String tz;

	WeathierBasicModel({this.cid, this.location, this.parent_city, this.admin_area, this.cnty, this.lat, this.lon, this.tz});

	WeathierBasicModel.fromJson(Map<String, dynamic> json) {
		cid = json['cid'];
		location = json['location'];
		parent_city = json['parent_city'];
		admin_area = json['admin_area'];
		cnty = json['cnty'];
		lat = json['lat'];
		lon = json['lon'];
		tz = json['tz'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cid'] = this.cid;
		data['location'] = this.location;
		data['parent_city'] = this.parent_city;
		data['admin_area'] = this.admin_area;
		data['cnty'] = this.cnty;
		data['lat'] = this.lat;
		data['lon'] = this.lon;
		data['tz'] = this.tz;
		return data;
	}
}

class WeathierNowModel {
  String cloud;
  String cond_code;
  String cond_txt;
  String admin_area;
  String fl;
  String hum;
  String pcpn;
  String pres;
  String tmp;
  String vis;
  String wind_deg;
  String wind_dir;
  String wind_sc;
  String wind_spd;

	WeathierNowModel({this.cloud, this.cond_code, this.cond_txt, this.admin_area, this.hum, this.pcpn, this.pres, this.tmp, this.vis, this.wind_deg, this.wind_dir, this.wind_sc, this.wind_spd});

	WeathierNowModel.fromJson(Map<String, dynamic> json) {
		cloud = json['cloud'];
		cond_code = json['cond_code'];
		cond_txt = json['cond_txt'];
		admin_area = json['admin_area'];
		fl = json['fl'];
		hum = json['hum'];
		pcpn = json['pcpn'];
		pres = json['pres'];
    tmp = json['tmp'];
		vis = json['vis'];
		wind_deg = json['wind_deg'];
    wind_dir = json['wind_dir'];
		wind_sc = json['wind_sc'];
		wind_spd = json['wind_spd'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['cloud'] = this.cloud;
		data['cond_code'] = this.cond_code;
		data['cond_txt'] = this.cond_txt;
		data['admin_area'] = this.admin_area;
		data['fl'] = this.fl;
		data['hum'] = this.hum;
		data['pcpn'] = this.pcpn;
		data['pres'] = this.pres;
    data['tmp'] = this.tmp;
		data['vis'] = this.vis;
		data['wind_deg'] = this.wind_deg;
    data['wind_dir'] = this.wind_dir;
		data['wind_sc'] = this.wind_sc;
		data['wind_spd'] = this.wind_spd;
		return data;
	}
}

