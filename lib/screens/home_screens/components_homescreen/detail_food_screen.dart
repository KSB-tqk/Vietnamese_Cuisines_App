import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/comments.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/components/food.dart';
import 'package:flutter_app_test/notifier/authentication.dart';
import 'package:flutter_app_test/notifier/comment_notifer.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:like_button/like_button.dart';

class DetailFood extends StatelessWidget {
  static String id = 'DetailFood';
  const DetailFood({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Food food = (ModalRoute.of(context).settings.arguments as List)[0];
    final authentication = Provider.of<AuthenticationService>(context);
    final step = food.recipe.split('#');
    //authentication.favoriteFood.listIdFood
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        shadowColor: kPrimaryColor,
        backgroundColor: kPrimaryColor,
        elevation: 0,
        title: Text(
          food.name,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              margin: EdgeInsets.only(top: size.height * 0.2),
              padding: EdgeInsets.only(top: size.height * 0.2),
              width: size.width,
              constraints: BoxConstraints(minHeight: size.height),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: kPrimaryColor,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            food.location,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SmoothStarRating(
                            borderColor: Colors.black12,
                            color: Colors.yellow,
                            rating: food.rating,
                            isReadOnly: true,
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 25),
                                child: LikeButton(
                                  isLiked: authentication
                                      .favoriteFood.listIdFood
                                      .contains(food.idFood),
                                  circleColor: CircleColor(
                                      start: Colors.red[300],
                                      end: Colors.red[600]),
                                  bubblesColor: BubblesColor(
                                    dotPrimaryColor: Colors.red[400],
                                    dotSecondaryColor: Colors.red[400],
                                  ),
                                  likeBuilder: (bool isLiked) {
                                    return Icon(
                                      Icons.favorite,
                                      color: isLiked
                                          ? Colors.red[600]
                                          : Colors.grey,
                                      size: 35,
                                    );
                                  },
                                  onTap: (bool) => onClickFavorFood(
                                      bool, context, food.idFood),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    // enableDrag: false,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    context: context,
                                    builder: (context) => SingleChildScrollView(
                                        child: BuildSheet(
                                      food: food,
                                    )),
                                  );
                                },
                                icon: Icon(
                                  Icons.message_rounded,
                                  size: 35,
                                  color: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        "Giới thiệu món ăn",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          food.describe.replaceAll("% ", '\n'),
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "Nguyên liệu",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "${food.ingredients.replaceAll("% ", '\n')}",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        "Cách chế biến",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: RichText(
                          text: TextSpan(
                            children: <TextSpan>[
                              for (int i = 0; i < step.length; i++)
                                i % 2 == 0
                                    ? TextSpan(
                                        text: step[i],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : TextSpan(
                                        text:
                                            "${step[i].replaceAll("% ", '\n\n')}",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                        ),
                                      ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Hero(
              tag: food.idFood,
              child: Image.network(
                food.image,
                // height: size.height * 0.4,
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Thêm/xóa món ăn yêu thích
  Future<bool> onClickFavorFood(
      bool isLike, BuildContext context, String idFood) async {
    final authentication =
        Provider.of<AuthenticationService>(context, listen: false);
    if (!isLike) {
      authentication.favoriteFood.listIdFood.add(idFood);
    } else {
      authentication.favoriteFood.listIdFood
          .removeWhere((element) => element == idFood);
    }
    await authentication.updateFavoriteFood();
    return !isLike;
  }
}

// load comment của từng food
class BuildSheet extends StatelessWidget {
  final Food food;
  const BuildSheet({key, this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authentication = Provider.of<AuthenticationService>(context);
    final comment = Provider.of<FoodComment>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return SizedBox.fromSize(
      size: Size(size.width, size.height * 0.65),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Bình luận',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Expanded(
              child: FutureBuilder<List<Comment>>(
                future: comment.getComment(food.idFood),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done ||
                      !snapshot.hasData) {
                    return Center(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Không có bình luận nào!',
                              style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  List<Comment> listComment = snapshot.data;
                  // Sắp xếp comments mới nhất
                  listComment.sort((a, b) {
                    var aDate = a.dateCreated;
                    var bDate = b.dateCreated;
                    return bDate.compareTo(aDate);
                  });
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: listComment.length,
                    itemBuilder: (BuildContext context, int index) {
                      final i = listComment[index];
                      return CommentItem(size: size, i: i);
                    },
                  );
                },
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black45,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: TextField(
                controller: comment.commentController,
                decoration: InputDecoration(
                  hintText: 'Nhập bình luận của bạn',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: kPrimaryColor, width: 2),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.send,
                      color: kPrimaryColor,
                    ),
                    onPressed: () async {
                      comment.addComment(
                          food.idFood,
                          authentication.userFood.idUser,
                          authentication.userFood.userName);
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// widget comment show
class CommentItem extends StatelessWidget {
  const CommentItem({
    Key key,
    @required this.size,
    @required this.i,
  }) : super(key: key);

  final Size size;
  final Comment i;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.width * 0.2,
      width: size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Wrap(
          children: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Center(
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        i.userName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        i.dateCreated.substring(0, i.dateCreated.indexOf(' ')),
                        style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Text(
                    i.content,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
