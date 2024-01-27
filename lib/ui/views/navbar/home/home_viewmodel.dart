
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:iqraa_w_irtaqi/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  HomeViewModel({this.context});
  BuildContext? context;
  bool isReady = false;

  final _navigationService = locator<NavigationService>();

  navigateTo({view}) {
    _navigationService.navigateWithTransition(view, curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
  }

  getData() {
    Timer(const Duration(milliseconds: 800,), () {
      isReady = true;
      notifyListeners();
    });
  }
}