import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
// 가로 : 80.w 높이 : 95.h

class ProjectSetting extends StatelessWidget {
  const ProjectSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '프로젝트 설정',
            style: TextStyle(fontSize: 12.sp),
          ),
          Container(
            width: 75.w,
            height: 30.h,
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: Colors.black, width: 1),
                    vertical: BorderSide(color: Colors.black, width: 1))),
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Database(연구과제)',
                        style: TextStyle(fontSize: 5.sp),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal:
                                    BorderSide(color: Colors.black, width: 1),
                                vertical:
                                    BorderSide(color: Colors.black, width: 1))),
                        width: 30.w,
                        height: 20.h,
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Project(학습 & 진단)',
                        style: TextStyle(fontSize: 5.sp),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border.symmetric(
                                horizontal:
                                    BorderSide(color: Colors.black, width: 1),
                                vertical:
                                    BorderSide(color: Colors.black, width: 1))),
                        width: 30.w,
                        height: 20.h,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
