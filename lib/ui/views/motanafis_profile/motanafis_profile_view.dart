import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/ui/views/motanafis_profile/motanafis_profile_viewmodel.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MoutanafisProfileView extends HookWidget {
  const MoutanafisProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoutanafisProfileViewModel>.reactive(
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
                const Text('حسابي', style: TextStyle(fontSize: 21),),
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
                SvgPicture.asset("assets/images/motanafisoun_profile.svg", width: screenWidthPercentage(context, percentage: 1)),
                verticalSpaceSmall,
                SvgPicture.asset("assets/images/profile_details.svg", ).center(),
                verticalSpaceSmall,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kMainColor1,
                      ),
                      child: const Text("اضافة أصدقاء", style: TextStyle(color: Colors.white)),
                    ),
                    horizontalSpaceSmall,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kMainColor1,
                      ),
                      child: const Text("تعديل الحساب", style: TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Row(
                  children: [
                    SizedBox(
                      width: screenWidthPercentage(context, percentage: 0.5),
                      child: Column(
                        children: [
                          Text('أعجبني', style: TextStyle(color: model.indexTab == 1 ? kMainColor1 : const Color(0xff544C4C))).center().gestures(onTap: () => model.updateIndexTab(value: 1)),
                          if (model.indexTab == 1) Container(
                            width: 50,
                            height: 2.5,
                            decoration: const BoxDecoration(
                              color: kMainColor1,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screenWidthPercentage(context, percentage: 0.5),
                      child: Column(
                        children: [
                          Text('مقاطع', style: TextStyle(color: model.indexTab == 2 ? kMainColor1 : const Color(0xff544C4C)),).center().gestures(onTap: () => model.updateIndexTab(value: 2)),
                          if (model.indexTab == 2) Container(
                            width: 50,
                            height: 2.5,
                            decoration: const BoxDecoration(
                                color: kMainColor1,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(10), topLeft: Radius.circular(10))
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  width: screenWidthPercentage(context, percentage: 0.85),
                  height: 1,
                  color: kBorderColor,
                ).center(),
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
      viewModelBuilder: () => MoutanafisProfileViewModel(),
    );
  }
}
