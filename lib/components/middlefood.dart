class MiddleFood {
  List<String> listMiddleFood;

  MiddleFood({this.listMiddleFood});

  MiddleFood.fromJson(Map<String, dynamic> json) {
    listMiddleFood = json['ListMiddleFood'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ListMiddleFood'] = this.listMiddleFood;
    return data;
  }
}
