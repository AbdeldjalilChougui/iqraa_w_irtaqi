import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iqraa_w_irtaqi/shared/colors.dart';
import 'package:iqraa_w_irtaqi/shared/ui_helpers.dart';
import 'package:iqraa_w_irtaqi/ui/views/edit_profile/edit_profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:stacked/stacked.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class EditProfileView extends HookWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var country = useTextEditingController(text: "السعودية");
    var name = useTextEditingController(text: "محمد العتيبي");
    var email = useTextEditingController(text: "med_3tb@gmail.com");
    var password = useTextEditingController(text: "123456789");

    return ViewModelBuilder<EditProfileViewModel>.reactive(
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
                const Text('تعديل الحساب', style: TextStyle(fontSize: 21),),
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
                SvgPicture.asset("assets/images/profile_card.svg", width: screenWidthPercentage(context, percentage: 1)),
                verticalSpaceMedium,
                const Text('الاسم الكامل').padding(horizontal: 15),
                verticalSpaceTiny,
                SizedBox(
                  // height: 50,
                  child: TextFormField(
                    controller: name,
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
                ).padding(horizontal: 15),
                verticalSpaceRegular,
                const Text('البريد الالكتروني').padding(horizontal: 15),
                verticalSpaceTiny,
                SizedBox(
                  // height: 50,
                  child: TextFormField(
                    validator: (value) => model.validateEmail(value: value),
                    controller: email,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: " بريدك الالكتروني..".tr(),
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
                ).padding(horizontal: 15),
                verticalSpaceRegular,
                const Text('كلمة السر').padding(horizontal: 15),
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
                      hintText: " كلمة السر..".tr(),
                      hintStyle: const TextStyle(fontSize: 14, color: kBlackColor),
                      fillColor: Colors.white70,
                      contentPadding: const EdgeInsets.all(1.0),
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
                ).padding(horizontal: 15),
                verticalSpaceRegular,
                const Text('تاريخ الازدياد').padding(horizontal: 15),
                verticalSpaceTiny,
                SizedBox(
                // height: 50,
                  child: TextFormField(
                    controller: model.birthdate,
                    readOnly: true,
                    onTap: () => model.showBirthDayPicker(context),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: ' تاريخ الازدياد',
                      hintStyle: const TextStyle(fontSize: 14, color: kBlackColor),
                      fillColor: Colors.white70,
                      contentPadding: const EdgeInsets.all(1.0),
                      suffixIcon: SvgPicture.asset("assets/icons/down_list.svg", ).padding(all: 15),
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kBorderColor),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kBorderColor),
                      ),
                    ),
                  ),
                ).padding(horizontal: 15),
                verticalSpaceRegular,
                const Text('الدولة / الاقليم').padding(horizontal: 15),
                verticalSpaceTiny,
                SizedBox(
                  // height: 50,
                  child: TextFormField(
                    controller: country,
                    readOnly: true,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      hintText: ' السعودية',
                      hintStyle: const TextStyle(fontSize: 14, color: kBlackColor),
                      fillColor: Colors.white70,
                      contentPadding: const EdgeInsets.all(1.0),
                      suffixIcon: SvgPicture.asset("assets/icons/down_list.svg", ).padding(all: 15),
                      filled: true,
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kBorderColor),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: kBorderColor),
                      ),
                    ),
                  ),
                ).padding(horizontal: 15),
                verticalSpaceLarge,
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: kMainColor1,
                  ),
                  child: Center(
                    child: Text('حفظ التغييرات'.tr(), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),),
                  ),
                ).gestures(
                  onTap: () {
                    showMotionToast(
                      context: context,
                      type: MotionToastType.success,
                      msg: "تم حفظ المعلومات بنجاح".tr(),
                    );
                    model.back();
                  },
                ).padding(horizontal: 15),
                verticalSpaceMedium,
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => EditProfileViewModel(),
    );
  }
}
