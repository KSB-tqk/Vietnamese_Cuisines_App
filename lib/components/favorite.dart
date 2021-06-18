class FavoriteFood {
  String idUser;
  List<String> listIdFood;

  FavoriteFood({this.idUser, this.listIdFood});

  FavoriteFood.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    listIdFood = json['ListIdFood'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser;
    data['ListIdFood'] = this.listIdFood;
    return data;
  }
}
