import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/ui/views/challenge_menu/challenge_menu_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ChallengeMenuView extends HookWidget {
  const ChallengeMenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ChallengeMenuViewModel>.reactive(
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
                const SizedBox(width: 40),
                const Text('متنافسون', style: TextStyle(fontSize: 21),),
                SvgPicture.asset("assets/icons/back.svg").padding(left: 10).gestures(onTap: () => model.back()),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: model.indexTab == 0 ? kMainColor1 : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Text('قرآن', style: TextStyle(color: model.indexTab == 0 ? Colors.white : Colors.black)),
                          SvgPicture.asset("assets/icons/music.svg", color: model.indexTab == 0 ? Colors.white : kBorderColor),
                        ],
                      ),
                    ).gestures(onTap: () => model.updateIndexTab(value: 0)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: model.indexTab == 1 ? kMainColor1 : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Text('مباشر+', style: TextStyle(color: model.indexTab == 1 ? Colors.white : Colors.black)),
                          SvgPicture.asset("assets/icons/tv.svg", color: model.indexTab == 1 ? Colors.white : kBorderColor),
                        ],
                      ),
                    ).gestures(onTap: () => model.updateIndexTab(value: 1)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: model.indexTab == 2 ? kMainColor1 : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Text('شائع', style: TextStyle(color: model.indexTab == 2 ? Colors.white : Colors.black)),
                          SvgPicture.asset("assets/icons/shot.svg"),
                        ],
                      ),
                    ).gestures(onTap: () => model.updateIndexTab(value: 2)),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: model.indexTab == 3 ? kMainColor1 : Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Row(
                        children: [
                          Text('أحداث', style: TextStyle(color: model.indexTab == 3 ? Colors.white : Colors.black)),
                          SvgPicture.asset("assets/icons/event.svg", color: model.indexTab == 3 ? Colors.white : kBorderColor),
                        ],
                      ),
                    ).gestures(onTap: () => model.updateIndexTab(value: 3)),
                  ],
                ).padding(horizontal: 15),
                verticalSpaceSmall,
                SvgPicture.asset("assets/images/banner.svg", width: screenWidthPercentage(context, percentage: 0.9),).center(),
                verticalSpaceSmall,
                verticalSpaceMedium,
                SizedBox(
                  height: 40,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: model.secondIndexTab == 0 ? kMainColor1 : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text('الكل', style: TextStyle(color: model.secondIndexTab == 0 ? Colors.white : Colors.black)),
                          ],
                        ),
                      ).gestures(onTap: () => model.updateSecondIndexTab(value: 0)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: model.secondIndexTab == 1 ? kMainColor1 : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text('تحدي 1', style: TextStyle(color: model.secondIndexTab == 1 ? Colors.white : Colors.black)),
                          ],
                        ),
                      ).gestures(onTap: () => model.updateSecondIndexTab(value: 1)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: model.secondIndexTab == 2 ? kMainColor1 : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text('تحدي 2', style: TextStyle(color: model.secondIndexTab == 2 ? Colors.white : Colors.black)),
                          ],
                        ),
                      ).gestures(onTap: () => model.updateSecondIndexTab(value: 2)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: model.secondIndexTab == 3 ? kMainColor1 : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text('تحدي 3', style: TextStyle(color: model.secondIndexTab == 3 ? Colors.white : Colors.black)),
                          ],
                        ),
                      ).gestures(onTap: () => model.updateSecondIndexTab(value: 3)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: model.secondIndexTab == 4 ? kMainColor1 : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text('تحدي 4', style: TextStyle(color: model.secondIndexTab == 4 ? Colors.white : Colors.black)),
                          ],
                        ),
                      ).gestures(onTap: () => model.updateSecondIndexTab(value: 4)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: model.secondIndexTab == 5 ? kMainColor1 : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text('تحدي 5', style: TextStyle(color: model.secondIndexTab == 5 ? Colors.white : Colors.black)),
                          ],
                        ),
                      ).gestures(onTap: () => model.updateSecondIndexTab(value: 5)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: model.secondIndexTab == 6 ? kMainColor1 : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text('تحدي 6', style: TextStyle(color: model.secondIndexTab == 6 ? Colors.white : Colors.black)),
                          ],
                        ),
                      ).gestures(onTap: () => model.updateSecondIndexTab(value: 6)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: model.secondIndexTab == 7 ? kMainColor1 : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            Text('تحدي 7', style: TextStyle(color: model.secondIndexTab == 7 ? Colors.white : Colors.black)),
                          ],
                        ),
                      ).gestures(onTap: () => model.updateSecondIndexTab(value: 7)),
                    ],
                  ),
                ),
                if (model.indexTab == 1)...[
                  GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 130 / 180,
                    ),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Image.asset("assets/images/video1.png"),
                      Image.asset("assets/images/video2.png"),
                      Image.asset("assets/images/video3.png"),
                      Image.asset("assets/images/video3.png"),
                      Image.asset("assets/images/video1.png"),
                      Image.asset("assets/images/video2.png"),
                    ],
                  ),
                ] else...[
                  GridView(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 130 / 180,
                    ),
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Image.asset("assets/images/video4.png"),
                      Image.asset("assets/images/video5.png"),
                      Image.asset("assets/images/video6.png"),
                      Image.asset("assets/images/video1.png"),
                      Image.asset("assets/images/video2.png"),
                      Image.asset("assets/images/video3.png"),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ChallengeMenuViewModel(),
    );
  }
}
