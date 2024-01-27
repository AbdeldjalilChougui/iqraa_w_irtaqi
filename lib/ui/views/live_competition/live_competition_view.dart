import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/ui/views/live_competition/live_competition_viewmodel.dart';
import 'package:iqraa_w_irtaqi/ui/views/motanafis_profile/motanafis_profile_view.dart';
import 'package:share/share.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:styled_widget/styled_widget.dart';

class LiveCompetitionView extends HookWidget {
  const LiveCompetitionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var message = useTextEditingController();

    return ViewModelBuilder<LiveCompetitionViewModel>.reactive(
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
                SvgPicture.asset("assets/icons/menu.svg").padding(horizontal: 10),
                const Text('متنافسون', style: TextStyle(fontSize: 21),),
                SvgPicture.asset("assets/icons/back.svg").padding(horizontal: 10).gestures(onTap: () => model.back()),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: screenHeightPercentage(context, percentage: 0.5) - 37,
                    width: double.maxFinite,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: AssetImage("assets/images/live_user1.png", ),
                        )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                horizontalSpaceSmall,
                                Image.asset("assets/icons/avatar.png", height: 28),
                                horizontalSpaceTiny,
                                const Text('محمد العتيبي', style: TextStyle(color: Colors.white, fontSize: 16),)
                              ]).gestures(onTap: () => model.navigateTo(view: const MoutanafisProfileView())),
                              Row(children: [
                                const Text('النتيجة:', style: TextStyle(color: Colors.white),),
                                horizontalSpaceTiny,
                                SvgPicture.asset("assets/icons/1.svg", ),
                                horizontalSpaceMedium,
                              ]),
                            ],
                          ),
                          verticalSpaceSmall,
                          Row(
                            children: [
                              horizontalSpaceSmall,
                              SvgPicture.asset("assets/icons/live.svg"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.maxFinite,
                    height: screenHeightPercentage(context, percentage: 0.5) - 37,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/live_user2.png", ),
                          )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                horizontalSpaceSmall,
                                Image.asset("assets/icons/avatar1.png", height: 28),
                                horizontalSpaceTiny,
                                const Text('انس المشوري', style: TextStyle(color: Colors.white, fontSize: 16),)
                              ]),
                              Row(children: [
                                const Text('النتيجة:', style: TextStyle(color: Colors.white),),
                                horizontalSpaceTiny,
                                SvgPicture.asset("assets/icons/0.svg", ),
                                horizontalSpaceMedium,
                              ]),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0xff7C7C7C).withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(40)
                                ),
                                child: const Icon(Icons.add, color: kMainColor1,).center(),
                              ),
                              horizontalSpaceSmall,
                              SizedBox(
                                // height: 50,
                                width: screenWidthPercentage(context, percentage: 0.75),
                                child: TextFormField(
                                  controller: message,
                                  textAlignVertical: TextAlignVertical.center,
                                  style: const TextStyle(fontSize: 14, color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: " اكتب هنا",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50)
                                    ),
                                    hintStyle: const TextStyle(fontSize: 14, color: Colors.white),
                                    fillColor: const Color(0xff7C7C7C).withOpacity(0.7),
                                    contentPadding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 5),
                                    suffixIcon: const Icon(Icons.send, color: Colors.white),
                                    filled: true,

                                  ),
                                ),
                              ),
                            ],
                          ).padding(horizontal: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => LiveCompetitionViewModel(),
    );
  }
}
