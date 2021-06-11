import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';

class SignUpDetail extends StatefulWidget {
  const SignUpDetail({key}) : super(key: key);

  @override
  _SignUpDetailState createState() => _SignUpDetailState();
}

class _SignUpDetailState extends State<SignUpDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(
        children: [
          SizedBox(height: 20),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.account_box_rounded,
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
              hintText: "Tên người dùng",
              hintStyle: TextStyle(
                fontSize: 14,
                color: Colors.black26,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
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
            height: 30,
          ),
          Text(
            "Đăng ký ngay!",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          Text(
            "Cùng khám phá ẩm thực Việt!",
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
