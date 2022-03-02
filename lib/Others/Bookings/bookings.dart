import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:parkapp/Assets/assets.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Others/Bookings/booking_map.dart';
import 'package:parkapp/Routes/routes.dart';
import 'package:parkapp/Theme/colors.dart';

int? timeSelected = 0;

class BookingsModel {
  String? type, dateTime, location, action, img;
  BookingsModel(this.type, this.dateTime, this.location, this.action, this.img);
}

class Bookings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List<BookingsModel> bookingData = [
      BookingsModel(locale.parkingTimeEnds, '00:20:12 ${locale.min}',
          'Lawnfield Parks', locale.addTime, Assets.myCar1),
      BookingsModel(locale.parkedOn, '25 ${locale.jun}, 10:00 am',
          'Peterson Tower', locale.repark, Assets.myCar2),
      BookingsModel(locale.parkedOn, '05 ${locale.jun}, 10:00 am',
          'Peterson Tower', locale.repark, Assets.myCar1),
      BookingsModel(locale.parkedOn, '01 ${locale.jun}, 10:00 am',
          'Peterson Tower', locale.repark, Assets.myCar2),
      BookingsModel(locale.parkedOn, '10 ${locale.jun}, 10:00 am',
          'Peterson Tower', locale.repark, Assets.myCar1),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      //   elevation: 0,
      //   backgroundColor: Colors.white,
      // ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 60),
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locale.myBookings!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 22,
                      ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: FadedSlideAnimation(
              Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.78,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingMap()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                            color: index == 0 ? primaryColor : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 20, top: 10),
                              child: Text(
                                bookingData[index].type!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                        fontSize: 13,
                                        color: index == 0
                                            ? Colors.grey[300]
                                            : Colors.grey[400]),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: 20, bottom: 5),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(bottom: 7),
                                          child: Text(
                                            bookingData[index].dateTime!,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1!
                                                .copyWith(
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 18,
                                                    color: index == 0
                                                        ? Colors.white
                                                        : Colors.black),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            index == 0
                                                ? Icon(
                                                    Icons.location_on_outlined,
                                                    color: cardbg,
                                                    size: 15,
                                                  )
                                                : Image.asset(
                                                    'assets/address/ic_other.png',
                                                    scale: 3,
                                                  ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              bookingData[index].location!,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1!
                                                  .copyWith(
                                                      fontSize: 13,
                                                      color: index == 0
                                                          ? cardbg
                                                          : Colors.grey[600]),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Image.asset(
                                        index == 0
                                            ? 'assets/pole_light.png'
                                            : 'assets/pole_dark.png',
                                        scale: 4.5,
                                      ),
                                      FadedScaleAnimation(
                                        Container(
                                          height: 50,
                                          child: Image.asset(
                                              bookingData[index].img!),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, PageRoutes.bookSpot);
                              },
                              child: Container(
                                height: 35,
                                decoration: BoxDecoration(
                                    color: index == 0
                                        ? Color(0xff17d37e)
                                        : Color(0xfff7fcfa),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        bottomRight: Radius.circular(10))),
                                child: Center(
                                    child: Text(
                                  bookingData[index].action!.toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 13,
                                        letterSpacing: 2,
                                        color: index == 0
                                            ? Colors.white
                                            : primaryColor,
                                      ),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              beginOffset: Offset(0, 0.4),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          )
        ],
      ),
    );
  }

  Future bottomTimeSheet(BuildContext context, AppLocalizations locale) {
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setModalState) {
            return Container(
              height: 250,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                    decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Row(
                      children: [
                        Text(
                          "Select Time",
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 17,
                              color: iconColor,
                              fontWeight: FontWeight.w500),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Center(
                            child: Text(
                              'DONE',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontSize: 15,
                                      letterSpacing: 2.5,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: primaryColor,
                          size: 20,
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          '${locale.now} - 12:00 ${locale.pm}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Spacer(),
                        Radio(
                          activeColor: primaryColor,
                          value: 1,
                          groupValue: timeSelected,
                          onChanged: (dynamic value) {
                            setModalState(() {
                              timeSelected = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: primaryColor,
                              size: 20,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              'Later',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Spacer(),
                            Radio(
                              activeColor: primaryColor,
                              value: 2,
                              groupValue: timeSelected,
                              onChanged: (dynamic value) {
                                setModalState(() {
                                  timeSelected = value;
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!)),
                              hintText: "Select Date",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 13.5, color: Colors.grey[500]),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[300]!)),
                              hintText: "Select Time",
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontSize: 13.5, color: Colors.grey[500]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          });
        });
  }
}
