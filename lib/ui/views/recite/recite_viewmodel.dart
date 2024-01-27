import 'dart:async';

import 'package:iqraa_w_irtaqi/app/app.locator.dart';
import 'package:flutter/animation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReciteViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool isClicked = false;
  bool isSearchTeacher = false;
  bool isAngleUpdated = false;
  bool isSearchAnimation = false;
  bool foundTeacher = false;

  reset() {
    isClicked = false;
    isSearchTeacher = false;
    isAngleUpdated = false;
    isSearchAnimation = false;
    foundTeacher = false;
    notifyListeners();
  }

  updateIsClicked({value}) {
    isClicked = value;
    notifyListeners();
  }

  isSearchTeacherUpdate({value}) {
    isSearchTeacher = value;
    isSearchAnimation = true;
    Timer(const Duration(milliseconds: 150), () {
      isSearchAnimation = false;
      notifyListeners();
    });
    notifyListeners();
  }

  searchTeacher({value}) {
    isSearchTeacherUpdate(value: value);
    Timer(const Duration(milliseconds: 3000), () {
      if (isSearchTeacher) foundTeacherUpdate(value: true);
    });
  }

  foundTeacherUpdate({value}) {
    foundTeacher = value;
    isSearchTeacher = false;
    notifyListeners();
  }

  void back() {
    _navigationService.back();
  }

  void navigateTo ({view}) {
    _navigationService.navigateWithTransition(view, curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
  }
}