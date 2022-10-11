import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromARGB(235, 255, 189, 67);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kAppbarColor = Color.fromARGB(72, 10, 0, 0);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

const String vinhomeLogo = 'assets/images/vinhome.jpg';

const kRadius = 0.0;

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

final List<String> imgList = [
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTdXNSVQbo22GE8Dgsiua5yjxSy_9HUfIvT-j2swIxNnVSn1h9nm6mEjzm9i3Pqf3XRlyY&usqp=CAU',
  'https://cdn.chotot.com/admincentre/uVbfwAE_XM6BAjZt8V2zK6fHCo0IEFDSUEOEIinvRCg/preset:raw/plain/4529f277e51fb656b6649b799d1ef1e3-2767832951337357203.jpg',
  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQ15xl2aZAIVGlvay1C7vz2Bk7N213NlH9sn9L4F2pIuMUdQ11DoNTlVNHhLokUJfCZmg&usqp=CAU'
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe7tF4xKlJKSgyKSfU1TegPJQHrsXSuPbK94bCOaWa5zMlPb_joHDmC3sGOneIPQMd-6A&usqp=CAU'
];

List<String> type = ["Bán căn hộ chung cư", "Cho thuê căn hộ chung cư"];

List<String> direction = [
  "Đông",
  "Tây",
  "Nam",
  "Bắc",
  "Đông-Bắc",
  "Tây-Bắc",
  "Tây-Nam",
  "Đông-Nam"
];
