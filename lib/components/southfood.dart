class SouthFood {
  List<String> listSouthFood;

  SouthFood({this.listSouthFood});

  SouthFood.fromJson(Map<String, dynamic> json) {
    listSouthFood = json['ListSouthFood'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ListSouthFood'] = this.listSouthFood;
    return data;
  }
}
