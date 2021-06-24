import 'package:flutter/material.dart';

class Comment {
  String commentID;
  String content;
  String dateCreated;
  String idUser;

  Comment({
    @required this.commentID,
    @required this.content,
    @required this.dateCreated,
    @required this.idUser,
  });

  Comment.fromJson(Map<String, dynamic> json) {
    commentID = json['commentID'];
    content = json['content'];
    dateCreated = json['dateCreated'];
    idUser = json['idUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentID'] = this.commentID;
    data['content'] = this.content;
    data['dateCreated'] = this.dateCreated;
    data['idUser'] = this.idUser;
    return data;
  }
}
