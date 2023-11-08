import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:provider/provider.dart';
import 'package:pas_ui/viewmodel/main_viewmodel.dart';
import 'package:pas_ui/viewmodel/project_setting_viewmodel.dart';

import 'package:pas_ui/view/algorithm_renew/algorithm_renew.dart';
import 'package:pas_ui/view/data_preprocessing/data_preprocess.dart';
import 'package:pas_ui/view/offline_learning/offline_learning.dart';
import 'package:pas_ui/view/online_analysis/online_analysis.dart';
import 'package:pas_ui/view/system_login/login.dart';
import 'package:pas_ui/view/project_setting/project_setting.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MainViewModel()),
      ChangeNotifierProvider(create: (context) => ProjectSettingViewModel()),
    ],
    child: MaterialApp(
      home: PAS(),
    ),
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
    List pas = [
      LoginPart(),
      ProjectSetting(),
      DataPreprocess(),
      OfflineLearning(),
      OnlineAnalysis(),
      AlgorithmRenew()
    ];

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
                  child: pas[context.watch<MainViewModel>().pageIndex],
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
      // 상태를 가져옵니다.
      var provider = context.watch<MainViewModel>();
      // 각 단계의 상태에 따라 색상을 결정합니다.
      Color getColor(int index) {
        switch (index) {
          case 0:
            return provider.isLogin ? Colors.lightGreen : Colors.white;
          case 1:
            return provider.isProjectSetting ? Colors.lightGreen : Colors.white;
          case 2:
            return provider.isPreprocess ? Colors.lightGreen : Colors.white;
          case 3:
            return provider.isOfflinelearning
                ? Colors.lightGreen
                : Colors.white;
          case 4:
            return provider.isOnlineanalysis ? Colors.lightGreen : Colors.white;
          case 5:
            return provider.isAlgorithmrenew ? Colors.lightGreen : Colors.white;
          default:
            return Colors.white;
        }
      }

      return Padding(
        padding: EdgeInsets.only(left: 1.w, top: 2.h, bottom: 2.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.circle,
              color: getColor(index),
              size: 2.w,
            ),
            SizedBox(
              width: 1.w,
            ),
            TextButton(
                onPressed: () {
                  context.read<MainViewModel>().pageIndex = index;
                },
                child: Text(
                  indexname[index],
                  style: TextStyle(fontSize: 5.sp, color: Colors.white),
                ))
          ],
        ),
      );
    });
