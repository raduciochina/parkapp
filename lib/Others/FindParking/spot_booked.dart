import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkapp/AppNavigation/app_navigation.dart';
import 'package:parkapp/Assets/assets.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';

class SpotBooked extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Text(
                'CLOSE',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 15,
                    letterSpacing: 2,
                    color: primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: backgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Image.asset(
                    'assets/booked.png',
                    scale: 3,
                  ),
                ),
                Text(
                  'Yay !! Booked it.',
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
                    'You\'ve booked parking Spot.',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15, color: iconColor),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          FadedSlideAnimation(
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.69,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Parking ID',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: Colors.grey[500]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'XW15434332',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5, color: Colors.black),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Vehicle',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: Colors.grey[500]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Toyota Matrix',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        // Spacer(),
                        Expanded(
                          child: Column(
                            children: [
                              Container(
                                width: 110,
                                child: Image.asset(Assets.qrCode),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Payment',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: Colors.grey[500]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '\$6.00 (Wallet)',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Parking Spot',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13.5,
                                        color: Colors.grey[500]),
                              ),
                              Text(
                                'AB-30',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 20, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Enter after',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[500]),
                                    ),
                                    Text(
                                      '12:30 pm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Mon, Jun 25',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[500]),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Exit before',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[500]),
                                    ),
                                    Text(
                                      '1:30 pm',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(fontSize: 20),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Mon, Jun 25',
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2!
                                          .copyWith(
                                              fontSize: 13.5,
                                              color: Colors.grey[500]),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.grey[500],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.grey[500],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey[500],
                              size: 5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              'assets/oncard/ic_spots.png',
                              scale: 2.5,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.grey[500],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.grey[500],
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Icon(
                              Icons.circle,
                              color: Colors.grey[500],
                              size: 5,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Parking Spot',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 13.5, color: Colors.grey[500]),
                        ),
                        Text(
                          'Lawnfield Parks',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '1024, Lawnfield Road, New york',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(
                                  fontSize: 13.5, color: Colors.grey[500]),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    FadedScaleAnimation(
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AppNavigation(1)));
                        },
                        child: ColorButton(locale.getDirection!.toUpperCase()),
                      ),
                      durationInMilliseconds: 500,
                    ),
                  ],
                )),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          )
        ],
      ),
    );
  }
}
