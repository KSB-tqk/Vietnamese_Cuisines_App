class UserFood {
  String idUser;
  String userName;
  String email;

  UserFood({this.idUser, this.userName, this.email});

  UserFood.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    userName = json['userName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idUser'] = this.idUser;
    data['userName'] = this.userName;
    data['email'] = this.email;
    return data;
  }
}
