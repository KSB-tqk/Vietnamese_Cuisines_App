import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/authentication.dart';
import 'package:provider/provider.dart';

class LoginDetail extends StatefulWidget {
  const LoginDetail({key}) : super(key: key);

  @override
  _LoginDetailState createState() => _LoginDetailState();
}

class _LoginDetailState extends State<LoginDetail> {
  TextEditingController emailController;
  TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthenticationService>(context);
    bool checkSnackBarShow = false;

    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 10),
            // Nhập tài khoản email
            TextFormField(
              controller: emailController,
              textInputAction: TextInputAction.next,
              validator: (val) =>
                  val.isNotEmpty ? null : "Email không được để trống!",
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
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
            TextFormField(
              controller: passwordController,
              obscureText: true,
              validator: (val) =>
                  val.length < 6 ? "Mật khẩu phải lớn hơn 6 kí tự!" : null,
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
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
              height: 20,
            ),
            Text(
              "Đăng nhập ngay!",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Cùng trải nghiệm ẩm thực Việt!",
              style: TextStyle(
                fontSize: 14,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              height: 50,
              child: OutlinedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {}
                  final String messege = await loginProvider.signIn(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  // if (!checkSnackBarShow) {
                  //   checkSnackBarShow = true;
                  //   await ScaffoldMessenger.of(context)
                  //       .showSnackBar(
                  //         SnackBar(
                  //           content: Text(
                  //             '$messege',
                  //             style: TextStyle(
                  //               color: Colors.white,
                  //             ),
                  //           ),
                  //           backgroundColor: kPrimaryColor,
                  //           duration: const Duration(milliseconds: 2000),
                  //         ),
                  //       )
                  //       .closed;
                  //   checkSnackBarShow = false;
                  // }
                },
                child: Text(
                  "Đăng nhập",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
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
    );
  }
}
