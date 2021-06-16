class TopFood {
  List<String> listTopFood;

  TopFood({this.listTopFood});

  TopFood.fromJson(Map<String, dynamic> json) {
    listTopFood = json['ListTopFood'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ListTopFood'] = this.listTopFood;
    return data;
  }
}
