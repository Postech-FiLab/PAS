// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:pas_ui/project_setting/project_setting.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:pas_ui/main_provider.dart';

final _idController = TextEditingController();
final _passwordController = TextEditingController();

class LoginPart extends StatelessWidget {
  const LoginPart({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MainProvider(),
      child: Column(
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
              width: 20.w,
              height: 10.h,
              child: const TextField(
                decoration: InputDecoration(labelText: "ID"),
              )),
          SizedBox(
              width: 20.w,
              height: 10.h,
              child: const TextField(
                decoration: InputDecoration(labelText: "PASSWORD"),
              )),
          TextButton(
              onPressed: () => _checkLogin(context),
              child: Text(
                "Login",
                style: TextStyle(fontSize: 5.sp, color: Colors.black),
              ))
        ],
      ),
    );
  }
}

void _checkLogin(BuildContext context) {
  if (_idController.text == 'filab' &&
      _passwordController.text == 'filab1020') {
    // Provider에서 isLogin을 true로 변경
    final provider = Provider.of<MainProvider>(context, listen: false);
    provider.isLogin = true;
    print(provider.isLogin);

    // 다음 페이지로 이동 (예: HomePage())
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => ProjectSetting()));
  } else {
    // 로그인 실패 메시지 표시 (예: Fluttertoast 또는 Scaffold의 SnackBar 사용)
  }
}
