import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_test/components/comments.dart';
import 'package:uuid/uuid.dart';

class FoodComment extends ChangeNotifier {
  TextEditingController commentController = TextEditingController();

  Future addComment(String idFood, String idUser, String userName) async {
    if (commentController.text.trim() != null) {
      var uuid = Uuid();
      Comment comment = Comment(
        commentID: uuid.v1(),
        content: commentController.text,
        dateCreated: DateTime.now().toString(),
        idUser: idUser,
        userName: userName,
      );

      await FirebaseFirestore.instance
          .collection('Comments')
          .doc(idFood)
          .collection('ListComment')
          .doc(comment.commentID)
          .set(comment.toJson());
    }
    commentController.clear();
  }

  Future<List<Comment>> getComment(String idFood) async {
    List<Comment> listComment = [];
    var snapshot = await FirebaseFirestore.instance
        .collection('Comments')
        .doc(idFood)
        .collection('ListComment')
        .get();
    listComment
        .addAll(snapshot.docs.map((e) => Comment.fromJson(e.data())).toList());

    return listComment;
  }
}
