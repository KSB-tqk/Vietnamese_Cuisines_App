import 'package:flutter/material.dart';

class Comment {
  String commentID;
  String content;
  String dateCreated;
  String idUser;
  String userName;

  Comment({
    @required this.commentID,
    @required this.content,
    @required this.dateCreated,
    @required this.idUser,
    @required this.userName,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    commentID = json['commentID'];
    content = json['content'];
    dateCreated = json['dateCreated'];
    idUser = json['idUser'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentID'] = this.commentID;
    data['content'] = this.content;
    data['dateCreated'] = this.dateCreated;
    data['idUser'] = this.idUser;
    data['userName'] = this.userName;
    return data;
  }
}
