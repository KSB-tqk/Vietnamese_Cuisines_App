import 'package:flutter/material.dart';
import 'package:flutter_app_test/components/constants.dart';
import 'package:flutter_app_test/notifier/authentication.dart';
import 'package:provider/provider.dart';

class SignUpDetail extends StatefulWidget {
  const SignUpDetail({key}) : super(key: key);

  @override
  _SignUpDetailState createState() => _SignUpDetailState();
}

class _SignUpDetailState extends State<SignUpDetail> {
  TextEditingController emailController;
  TextEditingController passwordController;
  TextEditingController confirmPassController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPassController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<AuthenticationService>(context);
    bool checkSnackBarShow = false;
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(height: 10),
            // Nhập tài khoản email
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              validator: (val) =>
                  val.isNotEmpty ? null : "Email không được để trống!",
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
              textInputAction: TextInputAction.next,
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
              height: 10,
            ),
            TextFormField(
              controller: confirmPassController,
              keyboardType: TextInputType.text,
              obscureText: true,
              textInputAction: TextInputAction.done,
              validator: (val) => val != passwordController.text
                  ? "Xác nhận mật khẩu không chính xác!"
                  : null,
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
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red),
                  borderRadius: BorderRadius.circular(15),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black38),
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: EdgeInsets.all(10),
                hintText: "Xác nhận mật khẩu",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.black26,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 200,
              height: 50,
              child: OutlinedButton(
                onPressed: () async {
                  if (_formKey.currentState.validate()) {}
                  final String messege = await loginProvider.signUp(
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                  );
                  if (!checkSnackBarShow) {
                    checkSnackBarShow = true;
                    await ScaffoldMessenger.of(context)
                        .showSnackBar(
                          SnackBar(
                            content: Text(
                              '$messege',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: kPrimaryColor,
                            duration: const Duration(milliseconds: 3000),
                          ),
                        )
                        .closed;
                    checkSnackBarShow = false;
                  }
                },
                child: Text(
                  "Đăng ký",
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
