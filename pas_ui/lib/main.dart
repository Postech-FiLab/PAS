import 'package:flutter/material.dart';
import 'package:pas_ui/login.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MaterialApp(
    home: PAS(),
  ));
}

class PAS extends StatefulWidget {
  const PAS({super.key});

  @override
  State<PAS> createState() => _PASState();
}

class _PASState extends State<PAS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Sizer(builder: ((context, orientation, deviceType) {
        return Column(
          children: [
            Container(
              width: 100.w,
              height: 2.5.h,
              color: Colors.black,
              child: Text(
                'Postech Factory Intelligence Lab',
                style: TextStyle(color: Colors.white, fontSize: 3.5.sp),
              ),
            ),
            Container(
              width: 100.w,
              height: 2.5.h,
              color: const Color(0xffB2c629),
            ),
            Row(
              children: [
                Container(
                  width: 20.w,
                  height: 95.h,
                  color: Colors.black,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.h,
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          height: 50.h,
                          color: Colors.grey,
                          child: pageIndex,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 80.w,
                  height: 95.h,
                  child: LoginPart(),
                )
              ],
            )
          ],
        );
      })),
    );
  }
}

List<String> indexname = [
  "시스템 로그인",
  "프로젝트 설정",
  "데이터 전처리",
  "Offline 학습",
  "Online 설비 진단",
  "알고리즘 갱신"
];

ListView pageIndex = ListView.builder(
    itemCount: 6, // 총 6개
    itemBuilder: (context, index) {
      return Padding(
        padding: EdgeInsets.only(left: 1.w, top: 2.h, bottom: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.circle,
              color: Colors.white,
              size: 2.w,
            ),
            SizedBox(
              width: 1.w,
            ),
            TextButton(
                onPressed: () {},
                child: Text(
                  indexname[index],
                  style: TextStyle(fontSize: 5.sp, color: Colors.white),
                ))
          ],
        ),
      );
    });
