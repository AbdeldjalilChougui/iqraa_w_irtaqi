import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:iqraa_w_irtaqi/app/app.locator.dart';
import 'package:flutter/animation.dart';
import 'package:iqraa_w_irtaqi/services/validation_service.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:stacked_services/stacked_services.dart';

class ChallengeMenuViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool isClicked = false;
  final _validationService = locator<ValidationService>();
  bool isObscure = true;
  int? indexTab = 0;
  int? secondIndexTab = 0;

  updateIsClicked({value}) {
    isClicked = value;
    notifyListeners();
  }

  updateIndexTab({value}) {
    indexTab = value;
    notifyListeners();
  }

  updateSecondIndexTab({value}) {
    secondIndexTab = value;
    notifyListeners();
  }

  void back() {
    _navigationService.back();
  }

  void navigateTo ({view}) {
    _navigationService.navigateWithTransition(view, curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
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
}