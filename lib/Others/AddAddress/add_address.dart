import 'dart:async';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Components/entry_field.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/OrderMapBloc/order_map_bloc.dart';
import 'package:parkapp/OrderMapBloc/order_map_state.dart';
import 'package:parkapp/Theme/colors.dart';
import 'package:parkapp/map_utils.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OrderMapBloc>(
      create: (context) => OrderMapBloc()..loadMap(),
      child: AddAddressBody(),
    );
  }
}


class AddAddressBody extends StatefulWidget {
  @override
  _AddAddressBodyState createState() => _AddAddressBodyState();
}

class _AddAddressBodyState extends State<AddAddressBody> {
  int? groupValue = 0;
  Completer<GoogleMapController> _mapController = Completer();
  GoogleMapController? mapStyleController;
  Set<Marker> _markers = {};

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          BlocBuilder<OrderMapBloc, OrderMapState>(
              builder: (context, state) {
                print('polyyyy' + state.polylines.toString());
                return GoogleMap(
                  // polylines: state.polylines,
                  mapType: MapType.normal,
                  initialCameraPosition: kGooglePlex,
                  // markers: _markers,
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
          FadedSlideAnimation(
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 50),
                  width: MediaQuery.of(context).size.width,
                  height: 280,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                              child: RadioListTile(
                                  activeColor: Colors.white,
                                  contentPadding: EdgeInsets.zero,
                                  dense: true,
                                  title: Text(
                                    locale.home!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: Colors.white, fontSize: 14),
                                  ),
                                  value: 1,
                                  groupValue: groupValue,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      groupValue = value;
                                    });
                                  }),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child: VerticalDivider(
                                  color: Colors.grey[300],
                                )),
                            Expanded(
                              child: RadioListTile(
                                  activeColor: Colors.white,
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    locale.office!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: Colors.white, fontSize: 14),
                                  ),
                                  value: 2,
                                  groupValue: groupValue,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      groupValue = value;
                                    });
                                  }),
                            ),
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 5),
                                child:
                                    VerticalDivider(color: Colors.grey[300])),
                            Expanded(
                              child: RadioListTile(
                                  activeColor: Colors.white,
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    locale.other!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            color: Colors.white, fontSize: 14),
                                  ),
                                  value: 3,
                                  groupValue: groupValue,
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      groupValue = value;
                                    });
                                  }),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          FadedSlideAnimation(
            Container(
              width: MediaQuery.of(context).size.width,
              height: 260,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      horizontalTitleGap: 0,
                      leading: Container(
                        height: 20,
                        child: Icon(
                          Icons.location_on,
                          color: primaryColor,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        "B121- Galaxy Residency, Hemiltone Tower",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 13.5, color: Theme.of(context).hintColor),
                      ),
                      subtitle: Text(
                        "New York, USA",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 13.5, color: Theme.of(context).hintColor),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    EntryFieldR(
                        locale.addLandmark, locale.writeAddressLandmark, false),
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                          );
                        },
                        child: FadedScaleAnimation(
                          ColorButton(locale.saveAddress),
                          durationInMilliseconds: 600,
                        )),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          ),
          Positioned(
            top: 110,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: EdgeInsets.symmetric(horizontal: 13),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.white),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.grey[200],
                  ),
                  Expanded(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white),
                      child: TextFormField(
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.grey[300]),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          border: InputBorder.none,
                          hintText: locale.searchLocation,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 14, color: Colors.grey[400]),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Icon(
                      Icons.gps_fixed,
                      size: 20,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
