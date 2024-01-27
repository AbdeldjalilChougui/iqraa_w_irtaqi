import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/ui/views/challenge_menu/challenge_menu_view.dart';
import 'package:iqraa_w_irtaqi/ui/views/live_competition/live_competition_view.dart';
import 'package:iqraa_w_irtaqi/ui/views/motanafis_profile/motanafis_profile_view.dart';
import 'package:share/share.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/ui/views/navbar/motanafisoun/motanafisoun_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:styled_widget/styled_widget.dart';

class MotanafisounView extends HookWidget {
  const MotanafisounView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MotanafisounViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            height: 80,
            decoration:  const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 10,
                  color: Colors.black12,
                  spreadRadius: 0,
                ),
              ],
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset("assets/icons/menu.svg").padding(horizontal: 10).gestures(
                  onTap: () => model.navigateTo(view: const ChallengeMenuView()),
                ),
                const Text('متنافسون', style: TextStyle(fontSize: 21),),
                SvgPicture.asset("assets/icons/search.svg").padding(horizontal: 10),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/images/user.png",),
              )
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                key: model.keyMenu,
                                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(color: kMainColor1),
                                ),
                                child: const Text("منافسة", style: TextStyle(color: kMainColor1, fontWeight: FontWeight.w500)),
                              ).gestures(onTap: () => model.navigateTo(view: const LiveCompetitionView())),
                              verticalSpaceMedium,
                              const Text("محمد العتيبي", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20), textDirection: TextDirection.ltr,),
                              const Text("ماشاء الله ", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),),
                              verticalSpaceTiny,
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/lang.svg", height: 15),
                                  const SizedBox(width: 5,),
                                  const Text("Show translation", style: TextStyle(fontSize: 11.0, color: Colors.white), textDirection: TextDirection.ltr,),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Stack(
                            key: model.keyMenu3,
                            children: [
                              Image.asset("assets/icons/avatar.png"),
                              Positioned(
                                child: SvgPicture.asset("assets/icons/follow.svg"),
                              ),
                            ],
                          ).gestures(onTap: () => model.navigateTo(view: const MoutanafisProfileView())),
                          verticalSpaceRegular,
                          SvgPicture.asset("assets/icons/like.svg"),
                          verticalSpaceRegular,
                          SvgPicture.asset("assets/icons/comment.svg"),
                          verticalSpaceRegular,
                          SvgPicture.asset(key: model.keyMenu2,"assets/icons/share.svg").gestures(
                            onTap: () async {
                              try {
                                await Share.share("https://github.com/abdeldjalilchougui");
                              } catch (e) {
                                print(e.toString());
                              }
                            }
                          ),
                        ],
                      ).padding(horizontal: 5),
                    ],
                  ),
                ),
                verticalSpaceRegular,
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => MotanafisounViewModel(),
      onViewModelReady: (model) => model.startTutorial(context: context),
    );
  }
}
