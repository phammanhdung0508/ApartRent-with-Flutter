import 'package:apart_rent/components/social_card.dart';
import 'package:apart_rent/constants.dart';
import 'package:apart_rent/provider/google_sign_in_service.dart';
import 'package:apart_rent/screens/sign_up/body/background.dart';
import 'package:apart_rent/screens/sign_up/body/sign_up_form.dart';
import 'package:apart_rent/size_config.dart';
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
              horizontal: getProportionateScreenHeight(20),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  Text("Đăng ký tài khoản", style: headingStyle),
                  const Text(
                    "Hoàn thành các thông tin bên dưới của bạn hoặc\ntiếp tục với mạng xã hội",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.08,
                  ),
                  const SignUpForm(),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.15,
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
                  SizedBox(height: getProportionateScreenHeight(40)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
