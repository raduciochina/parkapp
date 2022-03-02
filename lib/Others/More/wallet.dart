import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';

class Wallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List title = [
      locale.paidForParking,
      locale.addedToWallet,
      locale.paidForParking,
      locale.receivedFrom,
      locale.sendToBank,
      locale.receivedFrom,
      locale.paidForParking,
      locale.addedToWallet,
      locale.receivedFrom,
      locale.addedToWallet,
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
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
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      "\$159.50",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 22),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      locale.availableBalance!,
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
                SizedBox(
                  width: 40,
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
          FadedSlideAnimation(
            Stack(alignment: Alignment.bottomCenter, children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              locale.addMoney!.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 14,
                                      letterSpacing: 1.3),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 20,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              locale.sendToBank!.toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      color: Colors.white,
                                      fontSize: 14,
                                      letterSpacing: 1.3),
                            ),
                            SizedBox(
                              width: 10,
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
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    top: 10,
                  ),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Row(
                        children: [
                          Text(
                            title[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontSize: 13.5),
                          ),
                          Spacer(),
                          Text(
                            "\$${index + 100}.00",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(
                                    color: index % 2 == 0
                                        ? Colors.red
                                        : primaryColor,
                                    fontSize: 13.5),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text("Emili Anderson",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 11,
                                      color: Theme.of(context).hintColor)),
                          Spacer(),
                          Text("21 Jun, 11:02 am",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 11,
                                      color: Theme.of(context).hintColor))
                        ],
                      ),
                    );
                  },
                ),
              )
            ]),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
        ],
      ),
    );
  }
}
