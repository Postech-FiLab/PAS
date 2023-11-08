// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:pas_ui/viewmodel/main_viewmodel.dart';

final _idController = TextEditingController();
final _passwordController = TextEditingController();

class LoginPart extends StatelessWidget {
  const LoginPart({super.key});

  @override
  Widget build(BuildContext context) {
    // MainProvider에서 로그인 상태를 가져옵니다.
    final isLogin = context.watch<MainViewModel>().isLogin;

    // 로그인 상태에 따라 다른 위젯을 표시합니다.
    if (isLogin) {
      // 로그인 상태가 true면 'Login 완료' 메시지를 표시합니다.
      return Center(
        child: Text(
          'Login 완료',
          style: TextStyle(fontSize: 18.sp, color: Colors.black),
        ),
      );
    } else {
      // 로그인 상태가 false면 로그인 필드를 표시합니다.
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset('assets/logo/postech_logo.jpg'),
          ),
          SizedBox(
            width: 20.w,
            height: 20.h,
            child: Image.asset('assets/logo/FiLab.png'),
          ),
          SizedBox(
            width: 60.w,
            height: 10.h,
            child: TextField(
              controller: _idController,
              decoration: const InputDecoration(labelText: "ID"),
            ),
          ),
          SizedBox(
            width: 60.w,
            height: 10.h,
            child: TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: "PASSWORD"),
              obscureText: true,
            ),
          ),
          TextButton(
            onPressed: () {
              // ID와 Password를 검사합니다.
              if (_idController.text == 'filab' &&
                  _passwordController.text == 'filab1020') {
                // Provider를 사용하여 로그인 상태를 true로 설정합니다.
                context.read<MainViewModel>().isLogin = true;
              } else {
                // 로그인 실패 알림
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Invalid ID or Password'),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            child: Text(
              "Login",
              style: TextStyle(fontSize: 12.sp, color: Colors.black),
            ),
          ),
        ],
      );
    }
  }
}
