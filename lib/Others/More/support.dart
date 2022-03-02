import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Components/entry_field.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';

class Support extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            // alignment: Alignment.bottomCenter,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: backgroundColor,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            locale.support!,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 22),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              locale.connectUs!,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(fontSize: 16, color: iconColor),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                      Spacer(),
                      Expanded(
                        flex: 6,
                        child: FadedScaleAnimation(
                          Image.asset("assets/head_support.png"),
                          durationInMilliseconds: 600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              FadedSlideAnimation(
                Stack(alignment: Alignment.bottomCenter, children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  locale.callUs!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Spacer(),
                          Container(
                            height: 40,
                            child: VerticalDivider(
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 15),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  locale.mailUs!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          color: Colors.white, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  locale.writeUs!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 22),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  locale.letUsKnow!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                          fontSize: 15,
                                          color: Theme.of(context).hintColor),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                EntryFieldR(
                                    locale.phoneNumber! + '/' + locale.email!,
                                    locale.addContactInfo,
                                    false),
                                EntryFieldR(locale.addYourIssue,
                                    locale.addContactInfo, false)
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: FadedScaleAnimation(
                                  ColorButton(locale.submit),
                                  durationInMilliseconds: 600,
                                )),
                          )
                        ],
                      ))
                ]),
                beginOffset: Offset(0, 0.4),
                endOffset: Offset(0, 0),
                slideCurve: Curves.linearToEaseOut,
              )
            ],
          ),
        ),
      ),
    );
  }
}
