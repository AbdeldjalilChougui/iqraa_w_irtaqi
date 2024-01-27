import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/ui/views/navbar/irtaqi/irtaqi_viewmodel.dart';
import 'package:iqraa_w_irtaqi/ui/views/ranking/ranking_viewmodel.dart';
import 'package:iqraa_w_irtaqi/ui/views/recite/recite_viewmodel.dart';
import 'package:iqraa_w_irtaqi/ui/widgets/loader.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RankingView extends HookWidget {
  const RankingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RankingViewModel>.reactive(
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
                const Text('الترتيب الاجمالي', style: TextStyle(fontSize: 21),),
                SvgPicture.asset("assets/icons/back.svg").padding(left: 10).gestures(onTap: () => model.back()),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceMedium,
                Container(
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kMainColor1,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidthPercentage(context, percentage: 0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('المنافسة', style: TextStyle(color: Colors.white.withOpacity(0.35)),).center(),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidthPercentage(context, percentage: 0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            verticalSpaceTiny,
                            const Text('الحفّاظ', style: TextStyle(color: Colors.white)).center().gestures(onTap: () => model.updateIndexTab(value: 2)),
                            if (model.indexTab == 2) Container(
                              width: 60,
                              height: 3,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                              ),
                            ) else verticalSpaceTiny,
                          ],
                        ),
                      ),
                      SizedBox(
                        width: screenWidthPercentage(context, percentage: 0.3),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            verticalSpaceTiny,
                            const Text('الالتزام', style: TextStyle(color: Colors.white)).center().gestures(onTap: () => model.updateIndexTab(value: 1)),
                            if (model.indexTab == 1) Container(
                              width: 60,
                              height: 3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ) else verticalSpaceTiny,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceRegular,
                model.isClicked ? const Loader() : SvgPicture.asset('assets/images/podium.svg'),
                verticalSpaceRegular,
                model.isClicked ? const SizedBox() : SvgPicture.asset('assets/images/rank.svg', width: screenWidthPercentage(context, percentage: 1),),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => RankingViewModel(),
    );
  }
}
