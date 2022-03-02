import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(locale.myProfile!,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(letterSpacing: 0)),
                            SizedBox(
                              width: 10,
                            ),
                            Text(locale.everythingAboutyou!,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1!
                                    .copyWith(
                                        color: Theme.of(context).hintColor)),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Spacer(),
                        Stack(
                          alignment: Alignment.centerLeft,
                          children: [
                            FadedScaleAnimation(
                              Container(
                                padding: EdgeInsets.all(10),
                                width: 90,
                                child: Image.asset("assets/profiles/img1.png"),
                              ),
                              durationInMilliseconds: 600,
                            ),
                            CircleAvatar(
                              backgroundColor: primaryColor,
                              radius: 13,
                              child: Icon(
                                Icons.camera_alt,
                                color: Colors.white,
                                size: 13,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
            preferredSize: Size.fromHeight(150)),
      ),
      body: FadedSlideAnimation(
        Container(
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24), topRight: Radius.circular(24))),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                locale.fullName!,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey, fontSize: 13.5),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Samantha Smith",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 13.5),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                locale.emailAddress!,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey, fontSize: 13.5),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "samantha@mail.com",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 13.5),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                locale.phoneNumber!,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.grey, fontSize: 13.5),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "+1 98 654 3210",
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.black, fontSize: 13.5),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.pushReplacement(
                  //     context, MaterialPageRoute(builder: (context) => Signin()));
                  Phoenix.rebirth(context);
                },
                child: Text(
                  locale.logout!,
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: primaryColor, fontSize: 13.5),
                ),
              ),
            ],
          ),
        ),
        beginOffset: Offset(0.4, 0),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
