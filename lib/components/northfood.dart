class NorthFood {
  List<String> listNorthFood;

  NorthFood({this.listNorthFood});

  NorthFood.fromJson(Map<String, dynamic> json) {
    listNorthFood = json['ListNorthFood'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ListNorthFood'] = this.listNorthFood;
    return data;
  }
}
