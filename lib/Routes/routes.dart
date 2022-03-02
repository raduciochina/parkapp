import 'package:flutter/material.dart';
import 'package:parkapp/AppNavigation/app_navigation.dart';
import 'package:parkapp/Others/AddAddress/add_address.dart';
import 'package:parkapp/Others/AddVehicle/add_vehicle.dart';
import 'package:parkapp/Others/FindParking/book_spot.dart';
import 'package:parkapp/Others/More/faqs.dart';
import 'package:parkapp/Others/More/language.dart';
import 'package:parkapp/Others/More/manage_address.dart';
import 'package:parkapp/Others/More/my_profile.dart';
import 'package:parkapp/Others/More/my_vehicles.dart';
import 'package:parkapp/Others/More/privacy_policy.dart';
import 'package:parkapp/Others/More/support.dart';
import 'package:parkapp/Others/More/wallet.dart';

class PageRoutes {
  static const String appNavigation = "appNavigation";
  static const String addAddress = "addAddress";
  static const String addVehicle = "addVehicle";
  static const String faqs = "faqs";
  static const String language = "language";
  static const String manageAddress = "manageAddress";
  static const String myProfile = "myProfile";
  static const String myVehicles = "myVehicles";
  static const String privacyPolicy = "privacyPolicy";
  static const String support = "support";
  static const String wallet = "wallet";
  static const String bookSpot = "bookSpot";

  Map<String, WidgetBuilder> routes() {
    return {
      appNavigation: (context) => AppNavigation(),
      addAddress: (context) => AddAddress(),
      addVehicle: (context) => AddVehicle(),
      faqs: (context) => Faqs(),
      language: (context) => Language(),
      manageAddress: (context) => ManageAddress(),
      myProfile: (context) => MyProfile(),
      myVehicles: (context) => MyVehicles(),
      privacyPolicy: (context) => PrivacyPolicy(),
      support: (context) => Support(),
      wallet: (context) => Wallet(),
      bookSpot: (context) => BookSpot(),
    };
  }
}
