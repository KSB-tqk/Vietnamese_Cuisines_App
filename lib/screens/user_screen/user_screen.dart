import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/authentication.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserScreen extends StatefulWidget {
  static String id = 'UserScreen';
  const UserScreen({key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  TextEditingController newUserNameController;
  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    newUserNameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authentication = Provider.of<AuthenticationService>(context);
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: RichText(
          text: TextSpan(
            style: Theme.of(context)
                .textTheme
                .title
                .copyWith(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                  text: "Thông tin ",
                  style: TextStyle(color: Color(0xFFFE842D))),
              TextSpan(text: "Cá nhân", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              // SizedBox(
              //   height: 20,
              // ),
              // SizedBox(
              //   height: size.height * 0.15,
              //   width: size.height * 0.15,
              //   child: CircleAvatar(
              //     backgroundColor: kPrimaryColor,
              //   ),
              // ),
              // SizedBox(
              //   height: 10,
              // ),
              UserInfo(
                iconData: Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 22,
                ),
                press: () {
                  Alert(
                      context: context,
                      title: "Thay đổi tên",
                      content: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: newUserNameController,
                              validator: (val) => val.isNotEmpty
                                  ? null
                                  : "Tên không được để trống!",
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.account_circle,
                                  color: Colors.grey,
                                ),
                                labelText: 'Nhập tên mới',
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      buttons: [
                        DialogButton(
                          color: kPrimaryColor,
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              authentication.userFood.userName =
                                  newUserNameController.text.trim();
                              await authentication.updateUser();
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            "Thay đổi",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                },
                textTitle: authentication.userFood.userName,
                iconPress: Icon(Icons.arrow_forward_ios, color: Colors.grey),
              ),
              UserInfo(
                iconData: Icon(
                  Icons.email_rounded,
                  color: Colors.grey,
                  size: 22,
                ),
                press: null,
                textTitle: authentication.userFood.email,
                iconPress: Icon(null, color: Colors.grey),
              ),
              UserInfo(
                iconData: Icon(
                  Icons.lock_rounded,
                  color: Colors.grey,
                  size: 22,
                ),
                press: () {
                  Alert(
                      context: context,
                      title: "Thay đổi mật khẩu",
                      content: Form(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock_clock_rounded,
                                  color: Colors.grey,
                                ),
                                labelText: 'Mật khẩu hiện tại',
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.lock_rounded,
                                  color: Colors.grey,
                                ),
                                labelText: 'Mật khẩu mới',
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              obscureText: true,
                              keyboardType: TextInputType.text,
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                icon: Icon(
                                  Icons.check_circle,
                                  color: Colors.grey,
                                ),
                                labelText: 'Xác nhận mật khẩu',
                                labelStyle: TextStyle(color: Colors.grey),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black38),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: kPrimaryColor),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      buttons: [
                        DialogButton(
                          color: kPrimaryColor,
                          onPressed: () => Navigator.pop(context),
                          child: Text(
                            "Thay đổi",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ]).show();
                },
                iconPress: Icon(Icons.arrow_forward_ios, color: Colors.grey),
                textTitle: 'Change password',
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: 200,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    authentication.signOut();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Đăng xuất",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      backgroundColor: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key key,
    this.textTitle,
    this.iconData,
    this.press,
    this.iconPress,
  }) : super(key: key);

  final String textTitle;
  final Icon iconData, iconPress;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
            padding: EdgeInsets.all(20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.grey[300]),
        onPressed: press,
        child: Row(
          children: [
            iconData,
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                textTitle,
                style: TextStyle(color: Colors.black45, fontSize: 20),
              ),
            ),
            iconPress,
          ],
        ),
      ),
    );
  }
}
