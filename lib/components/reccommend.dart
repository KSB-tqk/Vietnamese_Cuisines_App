class ReccommendFood {
  List<String> listReccommend;

  ReccommendFood({this.listReccommend});

  ReccommendFood.fromJson(Map<String, dynamic> json) {
    listReccommend = json['ListReccommend'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ListReccommend'] = this.listReccommend;
    return data;
  }
}
