import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/app/app.locator.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class IqraaViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  bool isClicked = false;
  bool toggle = false;
  bool isMicOpen = false;

  updateIsClicked({value}) {
    isClicked = value;
    notifyListeners();
  }

  toggleUpdate() {
    toggle = !toggle;
    notifyListeners();
  }

  updateIsMicOpen() {
    isMicOpen = !isMicOpen;
    notifyListeners();
  }

  void back() {
    _navigationService.back();
  }

  void navigateTo ({view}) {
    _navigationService.navigateWithTransition(view, curve: Curves.easeIn, duration: const Duration(milliseconds: 300));
  }

  startTutorial({context}) {
    targets!.add(
      TargetFocus(
        identify: "keyMenu",
        keyTarget: keyMenu,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "اضغط لتفعيل خاصية التصحيح بالأحكام",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );

    tutorial = TutorialCoachMark(
        targets: targets!, // List<TargetFocus>
        colorShadow: kMainColor1, // DEFAULT Colors.black
        onFinish: (){
          print("finish");
        },
        onClickTargetWithTapPosition: (target, tapDetails) {
          print("target: $target");
          print("clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
        },
        onClickTarget: (target){
          print(target);
        },
        onSkip: () {
          print("skip");
          return false;
        }
    )..show(context:context);

    tutorial!.show(context: context);
  }

  @override
  void dispose() {
    if (tutorial != null) tutorial!.finish();
    super.dispose();
  }

  TutorialCoachMark? tutorial;
  GlobalKey? keyMenu = GlobalKey();

  List<TargetFocus>? targets = [];
}