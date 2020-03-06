class RankItemModel {
  int index;
  String place;
  int value;

  RankItemModel({this.index, this.place, this.value});

  RankItemModel.fromJson(Map<String, dynamic> json) {
    index = int.parse(json['ranking']); 
    place = json['place']['description'];
    value = int.parse(json['reading']['value']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    data['place'] = this.place;
    data['value'] = this.value;
    return data;
  }
}



