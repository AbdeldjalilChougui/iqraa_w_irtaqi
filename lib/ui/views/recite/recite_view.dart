import 'dart:math';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:iqraa_w_irtaqi/ui/views/navbar/irtaqi/irtaqi_viewmodel.dart';
import 'package:iqraa_w_irtaqi/ui/views/recite/recite_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ReciteView extends HookWidget {
  const ReciteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReciteViewModel>.reactive(
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
                const Text('العرض', style: TextStyle(fontSize: 21),),
                SvgPicture.asset("assets/icons/back.svg").padding(left: 10).gestures(onTap: () => model.back()),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            width: screenWidthPercentage(context, percentage: 1),
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: model.foundTeacher
                    ? const AssetImage("assets/images/user.png",)
                    : model.isSearchTeacher
                    ? const AssetImage("assets/images/user_search_teacher.png",)
                    : const AssetImage("assets/images/user.png",),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: model.foundTeacher
                  ? MainAxisAlignment.spaceBetween
                  : model.isSearchTeacher
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.end,
              children: [
                if (model.foundTeacher)...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidthPercentage(context, percentage: 0.5),
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(
                          color: kMainColor1,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text("العرض على شيخ", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)).center(),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SvgPicture.asset("assets/images/recite_aya.svg"),
                      verticalSpaceRegular,
                      Container(
                        width: screenWidthPercentage(context, percentage: 0.5),
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 50),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: kMainColor1),
                        ),
                        child: const Text("ايقاف العرض", style: TextStyle(color: kMainColor1, fontWeight: FontWeight.w500)).center(),
                      ).gestures(onTap: () => model.reset()),
                    ],
                  ),
                ] else if (model.isSearchTeacher)...[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidthPercentage(context, percentage: 0.5),
                        height: 40,
                        margin: const EdgeInsets.only(top: 20, right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                        decoration: BoxDecoration(
                          color: kMainColor1,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text("جاري البحث عن شيخ ...", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)).center(),
                      ),
                    ],
                  ),
                  RotatingImageAnimation(),
                ],
                if (!model.foundTeacher) Container(
                  width: screenWidthPercentage(context, percentage: 0.5),
                  height: 40,
                  margin: const EdgeInsets.only(bottom: 50),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: kMainColor1),
                  ),
                  child: Text( model.isSearchTeacher ? "ايقاف البحث" : "ابدأ البحث", style: const TextStyle(color: kMainColor1, fontWeight: FontWeight.w500)).center(),
                ).gestures(onTap: model.isSearchTeacher ? () => model.isSearchTeacherUpdate(value: false) : () => model.searchTeacher(value: true)),
              ],
            ),
          ).opacity(model.isSearchAnimation ? 0 : 1, animate: true)
              .animate(const Duration(milliseconds: 500), Curves.easeIn),
        ),
      ),
      viewModelBuilder: () => ReciteViewModel(),
    );
  }
}


class RotatingImageAnimation extends StatefulWidget {
  @override
  _RotatingImageAnimationState createState() => _RotatingImageAnimationState();
}
class _RotatingImageAnimationState extends State<RotatingImageAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller!,
      builder: (BuildContext context, Widget? child) {
        return Transform.rotate(
          angle: _controller!.value * 2 * pi,
          child: SvgPicture.asset("assets/icons/timer_search.svg"),
        );
      },
    );
  }
  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }
}