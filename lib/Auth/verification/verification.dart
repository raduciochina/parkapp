import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Components/entry_field.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';

import 'verification_interator.dart';

class Verification extends StatefulWidget {
  final VerificationInteractor verificationInteractor;
  Verification(this.verificationInteractor);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  @override
  void initState() {
    super.initState();
    widget.verificationInteractor.verifyNumber();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            color: backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      locale.verification!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      locale.inLessThanAmin!,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          fontSize: 14, color: Theme.of(context).hintColor),
                    )
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: FadedScaleAnimation(
                    Container(
                      child: Image.asset("assets/img_verification.png"),
                    ),
                    durationInMilliseconds: 600,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  locale.enterVerificationCodeWeveSent!,
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 14, color: Theme.of(context).hintColor),
                ),
                SizedBox(
                  height: 30,
                ),
                EntryField(hint: locale.enter6digit, label: locale.enterCode),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => NavigationHome()));
                      widget.verificationInteractor.verificationDone();
                    },
                    child: FadedScaleAnimation(
                      ColorButton(locale.getStarted),
                      durationInMilliseconds: 600,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
