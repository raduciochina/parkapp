import 'dart:async';

import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkapp/AppNavigation/app_navigation.dart';
import 'package:parkapp/Assets/assets.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/OrderMapBloc/order_map_bloc.dart';
import 'package:parkapp/OrderMapBloc/order_map_state.dart';
import 'package:parkapp/Routes/routes.dart';
import 'package:parkapp/Theme/colors.dart';
import 'package:parkapp/map_utils.dart';

int? timeSelected = 0;

class BookingMap extends StatelessWidget {
  const BookingMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: BookingMapBody(),
    );
  }
}

class BookingMapBody extends StatefulWidget {
  @override
  _BookingMapBodyState createState() => _BookingMapBodyState();
}

class _BookingMapBodyState extends State<BookingMapBody> {
  bool isExpanded = false;
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child:             BlocBuilder<OrderMapBloc, OrderMapState>(
                builder: (context, state) {
                  print('polyyyy' + state.polylines.toString());
                  return GoogleMap(
                    // polylines: state.polylines,
                    mapType: MapType.normal,
                    initialCameraPosition: kGooglePlex,
                    markers: _markers,
                    onMapCreated: (GoogleMapController controller) async {
                      _mapController.complete(controller);
                      mapStyleController = controller;
                      mapStyleController!.setMapStyle(mapStyle);
                      setState(() {
                        _markers.add(
                          Marker(
                            markerId: MarkerId('mark1'),
                            position:
                            LatLng(37.42796133580664, -122.085749655962),
                            icon: markerss.first,
                          ),
                        );
                        _markers.add(
                          Marker(
                            markerId: MarkerId('mark2'),
                            position:
                            LatLng(37.42496133180663, -122.081743655960),
                            icon: markerss[1],
                          ),
                        );
                        _markers.add(
                          Marker(
                            markerId: MarkerId('mark3'),
                            position:
                            LatLng(37.42196183580660, -122.089743655967),
                            icon: markerss[2],
                          ),
                        );
                      });
                    },
                  );
                }),
          ),
          isExpanded
              ? SizedBox.shrink()
              : FadedSlideAnimation(
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.68,
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/icons/ic_search.png',
                                  scale: 3.2,
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Flexible(
                                child: TextFormField(
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(color: Colors.grey[500]),
                                  decoration: InputDecoration(
                                    // isDense: true,
                                    border: InputBorder.none,
                                    hintText: locale!.searchLocation,
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText2!
                                        .copyWith(
                                            fontSize: 13,
                                            color: Colors.grey[500]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            height: 47,
                            width: 53,
                            // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Image.asset(
                              'assets/icons/ic_filter.png',
                              scale: 3,
                            ))
                      ],
                    ),
                  ),
                  beginOffset: Offset(0, -0.4),
                  endOffset: Offset(0, 0),
                  slideCurve: Curves.linearToEaseOut,
                ),
          isExpanded
              ? Positioned(
                  left: MediaQuery.of(context).size.width * 0.8,
                  top: 60,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = false;
                      });
                    },
                    child: Container(
                        height: 47,
                        width: 53,
                        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Image.asset(
                          'assets/icons/ic_close.png',
                          scale: 3,
                        )),
                  ),
                )
              : SizedBox.shrink(),
          isExpanded
              ? SizedBox.shrink()
              : Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isExpanded = true;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: FadedSlideAnimation(
                          BookingBox(),
                          beginOffset: Offset(0, 0.4),
                          endOffset: Offset(0, 0),
                          slideCurve: Curves.linearToEaseOut,
                        ),
                      )),
                ),
          isExpanded
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: FadedSlideAnimation(
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.692,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          children: [
                            Container(
                              height: 161,
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 145),
                                    child: Divider(
                                      thickness: 4,
                                      color: Color(0xff17d37e),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.only(
                                        start: 20, top: 10),
                                    child: Text(
                                      locale!.parkingTimeEnds!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(
                                              fontSize: 13,
                                              color: Colors.grey[300]),
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
                                                padding: const EdgeInsets.only(
                                                    bottom: 7),
                                                child: Text(
                                                  '00:20:12 ' + locale.min!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.white),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Icon(
                                                    Icons.location_on_outlined,
                                                    color: cardbg,
                                                    size: 15,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    'Lawnfield Parks',
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyText2!
                                                        .copyWith(
                                                            fontSize: 13,
                                                            color: cardbg),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Stack(
                                          children: [
                                            Image.asset(
                                              'assets/pole_light.png',
                                              scale: 4.5,
                                            ),
                                            FadedScaleAnimation(
                                              Container(
                                                height: 50,
                                                child:
                                                    Image.asset(Assets.myCar1),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, PageRoutes.bookSpot);
                                    },
                                    child: Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Color(0xff17d37e),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(10),
                                              bottomRight:
                                                  Radius.circular(10))),
                                      child: Center(
                                          child: Text(
                                        locale.addTime!.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1!
                                            .copyWith(
                                                fontSize: 13.5,
                                                fontWeight: FontWeight.w600,
                                                letterSpacing: 2,
                                                color: Colors.white),
                                      )),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  height: MediaQuery.of(context).size.height *
                                          0.69 -
                                      160,
                                  child: ListView(
                                    padding: EdgeInsets.only(bottom: 60),
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Parking ID',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 13.5,
                                                          color:
                                                              Colors.grey[500]),
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
                                                          fontSize: 13.5,
                                                          color: Colors.black),
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
                                                          color:
                                                              Colors.grey[500]),
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
                                                          fontSize: 13.5,
                                                          color: Colors.black),
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
                                                  child: Image.asset(
                                                      Assets.qrCode),
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Payment',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 13.5,
                                                          color:
                                                              Colors.grey[500]),
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
                                                          fontSize: 13.5,
                                                          color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Parking Spot',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 13.5,
                                                          color:
                                                              Colors.grey[500]),
                                                ),
                                                Text(
                                                  'AB-30',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1!
                                                      .copyWith(
                                                          fontSize: 20,
                                                          color: Colors.black),
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
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .stretch,
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
                                                                color: Colors
                                                                    .grey[500]),
                                                      ),
                                                      Text(
                                                        '12:30 pm',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Mon, Jun 25',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                                fontSize: 13.5,
                                                                color: Colors
                                                                    .grey[500]),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
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
                                                                color: Colors
                                                                    .grey[500]),
                                                      ),
                                                      Text(
                                                        '1:30 pm',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText1!
                                                            .copyWith(
                                                                fontSize: 20),
                                                      ),
                                                      SizedBox(
                                                        width: 20,
                                                      ),
                                                      Text(
                                                        'Mon, Jun 25',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyText2!
                                                            .copyWith(
                                                                fontSize: 13.5,
                                                                color: Colors
                                                                    .grey[500]),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
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
                                                    fontSize: 13.5,
                                                    color: Colors.grey[500]),
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
                                                    fontSize: 13.5,
                                                    color: Colors.grey[500]),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isExpanded = false;
                                      });
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AppNavigation(1)));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 15),
                                      child: ColorButton(locale.getDirection),
                                    )),
                              ],
                            ),
                          ],
                        )),
                    beginOffset: Offset(0, 0.4),
                    endOffset: Offset(0, 0),
                    slideCurve: Curves.linearToEaseOut,
                  ),
                )
              : SizedBox.shrink()
        ],
      ),
    );
  }
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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

class BookingBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Container(
      height: 145,
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20, top: 10),
            child: Text(
              locale.parkingTimeEnds!,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontSize: 13, color: Colors.grey[300]),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 20, bottom: 5),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 7),
                        child: Text(
                          '00:20:12 ${locale.min}',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: cardbg,
                            size: 15,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Lawnfield Parks',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(fontSize: 13, color: cardbg),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Image.asset(
                      'assets/pole_light.png',
                      scale: 4.5,
                    ),
                    Container(
                      height: 50,
                      child: Image.asset(Assets.myCar1),
                    ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.bookSpot);
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: Color(0xff17d37e),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Center(
                  child: Text(
                locale.addTime!.toUpperCase(),
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 2,
                    color: Colors.white),
              )),
            ),
          )
        ],
      ),
    );
  }
}
