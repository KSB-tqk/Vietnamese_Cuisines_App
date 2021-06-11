import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/components/constants.dart';

class LoginDetail extends StatefulWidget {
  const LoginDetail({key}) : super(key: key);

  @override
  _LoginDetailState createState() => _LoginDetailState();
}

class _LoginDetailState extends State<LoginDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          SizedBox(height: 20),
          // Nhập tài khoản email
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.mail_rounded,
                color: Colors.black38,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "Email",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.black26,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Nhập mật khẩu
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.lock_rounded,
                color: Colors.black38,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black38),
                borderRadius: BorderRadius.circular(15),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
                borderRadius: BorderRadius.circular(15),
              ),
              contentPadding: EdgeInsets.all(10),
              hintText: "Mật khẩu",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.black26,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            "Đăng nhập ngay!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          Text(
            "Trải nghiệm ẩm thực Việt Nam!",
            style: TextStyle(
              fontSize: 14,
              color: kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
