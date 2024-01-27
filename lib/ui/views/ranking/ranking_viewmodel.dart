import 'dart:async';

import 'package:iqraa_w_irtaqi/app/app.locator.dart';
import 'package:flutter/animation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RankingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool isClicked = false;
  int? indexTab = 1;

  updateIndexTab({value}) {
    indexTab = value;
    updateIsClicked(value: true);
    Timer(const Duration(milliseconds: 500), () {
      updateIsClicked(value: false);
    });
    notifyListeners();
  }

  updateIsClicked({value}) {
    isClicked = value;
    notifyListeners();
  }

  void back() {
    _navigationService.back();
  }

  void navigateTo ({view}) {
    _navigationService.navigateWithTransition(view, curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
  }
}