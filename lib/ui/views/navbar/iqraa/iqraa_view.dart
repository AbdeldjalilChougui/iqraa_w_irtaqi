import 'package:flutter_svg/flutter_svg.dart';
import 'package:animated_expandable_fab/animated_expandable_fab.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/ui/views/navbar/iqraa/iqraa_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class IqraaView extends HookWidget {
  const IqraaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<IqraaViewModel>.reactive(
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
                SvgPicture.asset("assets/icons/surah.svg"),
                SvgPicture.asset(key: model.keyMenu,
                    model.toggle
                    ? "assets/icons/toggle_on.svg"
                    : "assets/icons/toggle_off.svg").gestures(onTap: () => model.toggleUpdate()),
                SvgPicture.asset("assets/icons/saved.svg").padding(left: 10),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          backgroundColor: kMainColor1,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: SvgPicture.asset("assets/icons/mic.svg", height: 30),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceSmall,
                SvgPicture.asset("assets/images/quran.svg", ),
                verticalSpaceMedium,
              ],
            ).width(screenWidthPercentage(context, percentage: 1)),
          ),
        ),
      ),
      viewModelBuilder: () => IqraaViewModel(),
      onViewModelReady: (model) => model.startTutorial(context: context),
    );
  }
}
