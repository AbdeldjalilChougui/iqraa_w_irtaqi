import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/app/app.locator.dart';
import 'package:iqraa_w_irtaqi/services/api_service.dart';
import 'package:iqraa_w_irtaqi/services/validation_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class RegisterViewModel extends BaseViewModel {
  RegisterViewModel({this.lang});
  String? lang;

  bool isObscure = true;
  final _apiService = locator<ApiService>();
  final _navigationService = locator<NavigationService>();
  final _validationService = locator<ValidationService>();
  bool? isClicked = false;

  updateIsClicked({value}) {
    isClicked = value;
    notifyListeners();
  }

  String? validateEmail ({String? value}) {
    return _validationService.validateEmail(value);
  }

  String? validatePassword ({String? value}) {
    return _validationService.passwordValidation(value);
  }

  void changeObscure() {
    isObscure = !isObscure;
    notifyListeners();
  }

  void navigateTo({view}) {
    _navigationService.navigateWithTransition(view, curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
  }

  void clearAndNavigateTo({view}) {
    _navigationService.clearStackAndShowView(view,);
  }

  Future<String?> login({Map<String, dynamic>? body, context}) async {

    updateIsClicked(value: true);
    return await _apiService.login(
      body: body,
      context: context
    ).catchError((e) {
      updateIsClicked(value: false);
    });
  }
}