import 'package:apart_rent/components/no_account_text.dart';
import 'package:apart_rent/provider/google_sign_in_service.dart';
import 'package:apart_rent/screens/sign_in/body/background.dart';
import 'package:apart_rent/screens/sign_in/body/sign_form.dart';
import 'package:apart_rent/size_config.dart';
import 'package:apart_rent/components/social_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.04,
                  ),
                  Text(
                    "Chào mừng trở lại",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getProportionateScreenWidth(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    "Đăng nhập bằng email và mật khẩu của bạn \nhoặc sử dụng mạng xã hội",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.08,
                  ),
                  const SignForm(),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.08,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialCard(
                        icon: "assets/icons/google-icon.svg",
                        press: () {
                          final provider = Provider.of<GoogleSignInService>(
                              context,
                              listen: false);
                          provider.googleLogin();

                          Navigator.of(context).pop();
                        },
                      ),
                      SocialCard(
                        icon: "assets/icons/facebook-2.svg",
                        press: () {},
                      ),
                      SocialCard(
                        icon: "assets/icons/twitter.svg",
                        press: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  const NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
