import 'package:flutter/cupertino.dart';

const Color kMainColor1 = Color(0xff229D71);
const Color kMainColor2 = Color(0xffEFBB00);
const Color kRedColor = Color(0xffFF001F);
const Color kBlackColor = Color(0xff747980);
const Color kBorderColor = Color(0xffA2A2A6);
const Color kMainGray = Color(0xff808283);
const Color kMainDisabledGray = Color(0xffDDDDDD);
const Color kTextFiledMainColor = Color(0xfff3f7FB);
const Color kTextFiledGrayColor = Color(0xffF0F0F0);
const Color kStarColor = Color(0xffFFDD00);
const Color kGrayText = Color(0xff9FA0B4);
const Color kAgencyColor = Color(0xffECF7FE);

const kMainGradient = LinearGradient(
  colors: [
    kMainColor1,
    kMainColor2,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kMainDisabledGradient = LinearGradient(
  colors: [
    kMainDisabledGray,
    kMainDisabledGray,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

const kDisabledGradient = LinearGradient(
  colors: [
    kTextFiledGrayColor,
    kTextFiledGrayColor,
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);