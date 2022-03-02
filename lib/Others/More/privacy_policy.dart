import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Column(
        // alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      locale.privacyPolicy!,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(letterSpacing: 0, fontSize: 16),
                    ),
                    Text(
                      locale.howWeWork!,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1!
                          .copyWith(color: iconColor, fontSize: 15),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                // Spacer(),
                Expanded(
                  child: FadedScaleAnimation(
                    Image.asset(
                      "assets/head_faq.png",
                      // scale: 3.4,
                    ),
                    durationInMilliseconds: 600,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                // width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locale.termsOfUse!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(locale.lorem!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                              color: Colors.grey[600],
                              height: 1.7)),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        locale.privacyPolicy!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontSize: 15),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(locale.lorem!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                              color: Colors.grey[600],
                              height: 1.7)),
                      Text(locale.lorem!,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13, color: Colors.grey[600], height: 1.7))
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
