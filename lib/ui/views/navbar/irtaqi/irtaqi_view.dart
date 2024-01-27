import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/ui/views/navbar/irtaqi/irtaqi_viewmodel.dart';
import 'package:iqraa_w_irtaqi/ui/views/ranking/ranking_view.dart';
import 'package:iqraa_w_irtaqi/ui/views/recite/recite_view.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class IrtaqiView extends HookWidget {
  const IrtaqiView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IrtaqiViewModel>.reactive(
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
                SvgPicture.asset("assets/icons/menu.svg").padding(right: 10),
                const Text('ارتقي', style: TextStyle(fontSize: 21),),
                SvgPicture.asset("assets/icons/timer.svg").padding(left: 10),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/motanafisoun_profile.svg", width: screenWidthPercentage(context, percentage: 1)),
                verticalSpaceSmall,
                SvgPicture.asset("assets/images/irtaqi_details.svg", ).center(),
                verticalSpaceMedium,
                verticalSpaceLarge,
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: kMainColor1,
                  ),
                  child: const Center(
                    child: Text('اعرض الان', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                  ),
                ).gestures(
                  onTap: () => model.navigateTo(view: const ReciteView()),
                ),
                verticalSpaceSmall,
                Container(
                  width: MediaQuery.of(context).size.width - 60,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: kMainColor1,
                  ),
                  child: const Center(
                    child: Text('الترتيب', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                  ),
                ).gestures(
                  onTap: () => model.navigateTo(view: const RankingView()),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => IrtaqiViewModel(),
    );
  }
}
