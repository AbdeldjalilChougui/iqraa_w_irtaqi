import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:iqraa_w_irtaqi/ui/views/edit_profile/edit_profile_view.dart';
import 'package:iqraa_w_irtaqi/ui/views/navbar/profile/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ProfileView extends HookWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('الحساب', style: TextStyle(fontSize: 21),),
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpaceRegular,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('عام', style: TextStyle(fontSize: 16),),
                  ],
                ),
                verticalSpaceTiny,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: kMainColor1,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: kMainColor1,
                        spreadRadius: 0,
                      ),
                    ],
                    backgroundBlendMode: BlendMode.dstATop,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(key: model.keyMenu, "تعديل الحساب الشخصي", style: const TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/person.svg"),
                        ],
                      ).gestures(
                        onTap: () => model.navigateTo(view: const EditProfileView()),
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("الأمان", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/privacy.svg"),
                        ],
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("الاشعارات", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/notification.svg"),
                        ],
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("الخصوصية", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/lock2.svg"),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceRegular,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('الدعم', style: TextStyle(fontSize: 16),),
                  ],
                ),
                verticalSpaceTiny,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: kMainColor1,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: kMainColor1,
                        spreadRadius: 0,
                      ),
                    ],
                    backgroundBlendMode: BlendMode.dstATop,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("اشتراكاتي", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/wallet.svg"),
                        ],
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("المساعدة و الدعم", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/question.svg"),
                        ],
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("الشروط و السياسات", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/conditions.svg"),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceRegular,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('عمليات أخرى', style: TextStyle(fontSize: 16),),
                  ],
                ),
                verticalSpaceTiny,
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: kMainColor1,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 3,
                        color: kMainColor1,
                        spreadRadius: 0,
                      ),
                    ],
                    backgroundBlendMode: BlendMode.dstATop,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("الابلاغ عن خلل", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/report.svg"),
                        ],
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("اضافة حساب", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/people.svg"),
                        ],
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("تسجيل الخروج", style: TextStyle(color: Colors.white)),
                          SvgPicture.asset("assets/icons/logout.svg"),
                        ],
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => ProfileViewModel(),
      onViewModelReady: (model) => model.startTutorial(context: context),
    );
  }
}
