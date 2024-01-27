import 'dart:async';
import 'package:iqraa_w_irtaqi/services/token_service.dart';
import 'package:iqraa_w_irtaqi/ui/views/index/index_view.dart';
import 'package:flutter/animation.dart';
import 'package:iqraa_w_irtaqi/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:iqraa_w_irtaqi/ui/views/login/login_view.dart';

class SplashViewModel extends FutureViewModel<dynamic> {
  bool isDone = false;
  final _navigationService = locator<NavigationService>();
  final _tokenService = locator<TokenService>();

  navigateTo({view}) {
    _navigationService.navigateWithTransition(view, curve: Curves.easeIn);
  }

  Future<bool> checkToken() async {
    return await _tokenService.isTokenExist();
  }

  void replaceTo({view})  {
    _navigationService.replaceWithTransition(view, curve: Curves.easeIn);
  }

  @override
  Future<bool?> futureToRun() async {
    setBusy(true);

    Timer(const Duration(milliseconds: 100), () async {
      isDone = true;
      notifyListeners();
    },);

    if (await checkToken()) {
      Timer(const Duration(milliseconds: 2500), () async {
        replaceTo(view: const WebSocketListener());
      },);
    } else {
      Timer(const Duration(milliseconds: 2000), () async {
        navigateTo(view: const LoginView());
      },);
    }

    setBusy(false);
    return null;
  }
}