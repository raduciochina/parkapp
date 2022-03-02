import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Components/entry_field.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';
import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: FadedSlideAnimation(
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Spacer(),
                Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 50,
                          color: backgroundColor,
                        ),
                        Image.asset("assets/img_sign.png", scale: 3),
                      ],
                    ),
                    Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width * 0.37,
                        child: Image.asset("assets/logo1.png", scale: 3)),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Spacer(),
                      Text(
                        locale.signInNow!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).hintColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      EntryField(
                        controller: _numberController,
                        label: locale.phoneNumber,
                        hint: locale.enterMobileNumber,
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          //Navigator.pushNamed(context, PageRoutes.signUp);
                          widget.loginInteractor
                              .loginWithPhone('isoCode', 'mobileNumber');
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ColorButton(locale.continuee),
                        ),
                      ),
                      Spacer(),
                      Text(
                        locale.orContinueWith!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: Theme.of(context).hintColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500),
                      ),
                      Spacer(),
                      Container(
                        height: 70,
                        padding: EdgeInsets.only(bottom: 20, top: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            socialButton('assets/ic_fb.png', locale.facebook!),
                            Container(
                              width: 1,
                              height: 25,
                              color: Theme.of(context).backgroundColor,
                            ),
                            socialButton('assets/ic_google.png', locale.google!)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  TextButton socialButton(String icon, String text) {
    return TextButton.icon(
      icon: ImageIcon(
        AssetImage(icon),
        color: Theme.of(context).backgroundColor,
        size: 20,
      ),
      onPressed: () {},
      label: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(color: Theme.of(context).backgroundColor),
      ),
    );
  }
}
