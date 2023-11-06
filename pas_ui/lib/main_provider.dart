import 'package:flutter/material.dart';

class MainProvider extends ChangeNotifier {
  bool _isLogin = false;
  bool _isProjectsetting = false;
  bool _isPreprocess = false;
  bool _isOfflinelearning = false;
  bool _isOnlineanalysis = false;
  bool _isAlgorithmrenew = false;

  int _pageIndex = 0;

  bool get isLogin => _isLogin;
  bool get isProjectSetting => _isProjectsetting;
  bool get isPreprocess => _isPreprocess;
  bool get isOfflinelearning => _isOfflinelearning;
  bool get isOnlineanalysis => _isOnlineanalysis;
  bool get isAlgorithmrenew => _isAlgorithmrenew;
  int get pageIndex => _pageIndex;

  set pageIndex(int value) {
    _pageIndex = value;
    notifyListeners();
  }

  set isLogin(bool value) {
    _isLogin = value;
    notifyListeners(); // 상태가 변경될 때마다 리스너들에게 알립니다.
  }

  set isProjectSetting(bool value) {
    _isProjectsetting = value;
    notifyListeners(); // 상태가 변경될 때마다 리스너들에게 알립니다.
  }

  set isPreprocess(bool value) {
    _isPreprocess = value;
    notifyListeners();
  }

  set isOfflinelearning(bool value) {
    _isOfflinelearning = value;
    notifyListeners();
  }

  set isOnlineanalysis(bool value) {
    _isOnlineanalysis = value;
    notifyListeners();
  }

  set isAlgorithmnrenew(bool value) {
    _isAlgorithmrenew = value;
    notifyListeners();
  }
}
