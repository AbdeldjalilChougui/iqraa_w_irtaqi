import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/ui/views/register/register_viewmodel.dart';
import 'package:motion_toast/resources/arrays.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:iqraa_w_irtaqi/ui/views/index/index_view.dart';
import 'package:iqraa_w_irtaqi/ui/widgets/loader.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterView extends HookWidget {
  const RegisterView({Key? key, this.lang}) : super(key: key);
  final String? lang;

  @override
  Widget build(BuildContext context) {
    var lastName = useTextEditingController();
    var firstName = useTextEditingController();
    var email = useTextEditingController();
    var password = useTextEditingController();

    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              height: screenHeightPercentage(context, percentage: 1),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView(
                children: [
                  verticalSpaceMedium,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("تسجيل الحساب", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17)),
                    ],
                  ),
                  verticalSpaceMedium,
                  const Text('الاسم'),
                  verticalSpaceTiny,
                  SizedBox(
                    // height: 50,
                    child: TextFormField(
                      controller: firstName,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: " قم بكتابة الاسم ..".tr(),
                        hintStyle: const TextStyle(fontSize: 14, color: kBlackColor),
                        fillColor: Colors.white70,
                        contentPadding: const EdgeInsets.all(1.0),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBorderColor),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBorderColor),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceRegular,
                  const Text('اللقب'),
                  verticalSpaceTiny,
                  SizedBox(
                    // height: 50,
                    child: TextFormField(
                      controller: lastName,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: " قم بكتابة اللقب ..".tr(),
                        hintStyle: const TextStyle(fontSize: 14, color: kBlackColor),
                        fillColor: Colors.white70,
                        contentPadding: const EdgeInsets.all(1.0),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBorderColor),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBorderColor),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceRegular,
                  const Text('البريد الالكتروني'),
                  verticalSpaceTiny,
                  SizedBox(
                    // height: 50,
                    child: TextFormField(
                      validator: (value) => model.validateEmail(value: value),
                      controller: email,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "بريدك الالكتروني..".tr(),
                        hintStyle: const TextStyle(fontSize: 14, color: kBlackColor),
                        fillColor: Colors.white70,
                        prefixIcon: const Icon(Icons.email_outlined, color: kBlackColor),
                        contentPadding: const EdgeInsets.all(1.0),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBorderColor),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBorderColor),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceRegular,
                  const Text('كلمة السر'),
                  verticalSpaceTiny,
                  SizedBox(
                    // height: 50,
                    child: TextFormField(
                      validator: (value) => model.validatePassword(value: value),
                      controller: password,
                      obscureText: model.isObscure,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        hintText: "كلمة السر..".tr(),
                        hintStyle: const TextStyle(fontSize: 14, color: kBlackColor),
                        fillColor: Colors.white70,
                        contentPadding: const EdgeInsets.all(1.0),
                        prefixIcon: const Icon(Icons.lock, color: kBlackColor),
                        suffixIcon: Icon(model.isObscure ? Icons.remove_red_eye : Icons.remove_red_eye_outlined, color: kBlackColor,).gestures(
                          onTap: () => model.changeObscure(),
                        ),
                        filled: true,
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBorderColor),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: kBorderColor),
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  const Text.rich(
                    TextSpan(
                        text: "من خلال التسجيل فإنك توافق على ",
                        children: [
                          TextSpan(
                              text: "الشروط والأحكام وسياسة الخصوصية الخاصة بنا.*",
                              style: TextStyle(color: kMainColor1)
                          ),
                        ]
                    ),
                  ),
                  verticalSpaceLarge,
                  Container(
                    width: MediaQuery.of(context).size.width - 60,
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: kMainColor1,
                    ),
                    child: Center(
                      child: model.isClicked! ? const Loader(color: Colors.white,).center() : Text('تأكيد'.tr(), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                    ),
                  ).gestures(
                    onTap: model.isClicked! ? () {} : () {
                      if (email.text.isEmpty || password.text.isEmpty || lastName.text.isEmpty || firstName.text.isEmpty) {
                        showMotionToast(
                          context: context,
                          type: MotionToastType.warning,
                          msg: "جميع الحقول إلزامية، املأ جميع الحقول المفقودة".tr(),
                        );
                      } else {
                        model.clearAndNavigateTo(view: const WebSocketListener());
                        // model.login(body: {
                        //   "email": email.text,
                        //   "password": password.text,
                        // }, context: context,).then((value) {
                        //   model.updateIsClicked(value: false);
                        //   if (value != null) {
                        //   }
                        // });
                      }
                    },
                  ),
                  verticalSpaceMedium,
                  SvgPicture.asset("assets/icons/divider.svg", ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: kBorderColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset("assets/icons/facebook.svg"),
                      ),
                      horizontalSpaceRegular,
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: kBorderColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset("assets/icons/goolge.svg"),
                      ),
                      horizontalSpaceRegular,
                      Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          border: Border.all(color: kBorderColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SvgPicture.asset("assets/icons/linkedin.svg"),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  const Text.rich(
                    TextSpan(
                        text: "قمت بالتسجيل بالفعل؟",
                        children: [
                          TextSpan(
                              text: " تسجيل الدخول",
                              style: TextStyle(color: kMainColor1)
                          ),
                        ]
                    ),
                  ).center().gestures(
                    onTap: () => model.navigateTo(view: const RegisterView()),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => RegisterViewModel(lang: lang),
    );
  }
}
