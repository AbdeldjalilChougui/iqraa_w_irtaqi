import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:iqraa_w_irtaqi/ui/views/navbar/home/home_viewmodel.dart';
import 'package:iqraa_w_irtaqi/ui/widgets/loader.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

class HomeView extends HookWidget {
  const HomeView({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('الرئيسية', style: TextStyle(fontSize: 21),),
              ],
            ),
          ),
        ),
        body: SizedBox(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset("assets/images/motanafisoun_profile.svg", width: screenWidthPercentage(context, percentage: 1)),
                verticalSpaceSmall,
                if (model.isReady) ... [
                  SvgPicture.asset("assets/images/irtaqi_details.svg", ).center(),
                  verticalSpaceMedium,
                  SvgPicture.asset("assets/images/stat1.svg", ).center(),
                  verticalSpaceMedium,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('التقدم', style: TextStyle(fontSize: 16),),
                    ],
                  ).padding(horizontal: 15),
                  verticalSpaceSmall,
                  SvgPicture.asset("assets/images/stat2.svg", ).center(),
                ] else ...[
                  const Loader(),
                ],
                verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(context: context),
      onViewModelReady: (model) => model.getData(),
    );
  }
}