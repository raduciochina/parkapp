import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'dart:async';

import 'Languages/arabic.dart';
import 'Languages/english.dart';
import 'Languages/french.dart';
import 'Languages/indonesian.dart';
import 'Languages/italian.dart';
import 'Languages/portuguese.dart';
import 'Languages/spanish.dart';
import 'Languages/swahili.dart';
import 'Languages/turkish.dart';

class AppLocalizations {
  final Locale locale;
  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': english(),
    'ar': arabic(),
    'pt': portuguese(),
    'fr': french(),
    'id': indonesian(),
    'es': spanish(),
    'tr': turkish(),
    'it': italian(),
    'sw': swahili()
  };

  String? get enterMobileNumber {
    return _localizedValues[locale.languageCode]!['enterMobileNumber'];
  }

  String? get signInNow {
    return _localizedValues[locale.languageCode]!['signInNow'];
  }

  String? get orContinueWith {
    return _localizedValues[locale.languageCode]!['orContinueWith'];
  }

  String? get facebook {
    return _localizedValues[locale.languageCode]!['facebook'];
  }

  String? get support {
    return _localizedValues[locale.languageCode]!['support'];
  }

  String? get account {
    return _localizedValues[locale.languageCode]!['account'];
  }

  String? get hatchback {
    return _localizedValues[locale.languageCode]!['hatchback'];
  }

  String? get google {
    return _localizedValues[locale.languageCode]!['google'];
  }

  String? get am {
    return _localizedValues[locale.languageCode]!['am'];
  }

  String? get logout {
    return _localizedValues[locale.languageCode]!['logout'];
  }

  String? get letUsKnow {
    return _localizedValues[locale.languageCode]!['letUsKnow'];
  }

  String? get pm {
    return _localizedValues[locale.languageCode]!['pm'];
  }

  String? get jun {
    return _localizedValues[locale.languageCode]!['jun'];
  }

  String? get phoneNumber {
    return _localizedValues[locale.languageCode]!['phoneNumber'];
  }

  String? get fullName {
    return _localizedValues[locale.languageCode]!['fullName'];
  }

  String? get emailAddress {
    return _localizedValues[locale.languageCode]!['emailAddress'];
  }

  String? get continuee {
    return _localizedValues[locale.languageCode]!['continuee'];
  }

  String? get backToSignIn {
    return _localizedValues[locale.languageCode]!['backToSignIn'];
  }

  String? get phoneCode {
    return _localizedValues[locale.languageCode]!['phoneCode'];
  }

  String? get enterVerificationCodeWeveSent {
    return _localizedValues[locale.languageCode]!
        ['enterVerificationCodeWeveSent'];
  }

  String? get enterVerificationCode {
    return _localizedValues[locale.languageCode]!['enterVerificationCode'];
  }

  String? get verification {
    return _localizedValues[locale.languageCode]!['verification'];
  }

  String? get enter6digit {
    return _localizedValues[locale.languageCode]!['enter6digit'];
  }

  String? get continueWord {
    return _localizedValues[locale.languageCode]!['continueWord'];
  }

  String? get inLessThanAmin {
    return _localizedValues[locale.languageCode]!['inLessThanAmin'];
  }

  String? get getStarted {
    return _localizedValues[locale.languageCode]!['getStarted'];
  }

  String? get enterFullName {
    return _localizedValues[locale.languageCode]!['enterFullName'];
  }

  String? get enterEmailAddress {
    return _localizedValues[locale.languageCode]!['enterEmailAddress'];
  }

  String? get wellSendCode {
    return _localizedValues[locale.languageCode]!['wellSendCode'];
  }

  String? get searchLocation {
    return _localizedValues[locale.languageCode]!['searchLocation'];
  }

  String? get now {
    return _localizedValues[locale.languageCode]!['now'];
  }

  String? get find {
    return _localizedValues[locale.languageCode]!['find'];
  }

  String? get bookings {
    return _localizedValues[locale.languageCode]!['bookings'];
  }

  String? get more {
    return _localizedValues[locale.languageCode]!['more'];
  }

  String? get home {
    return _localizedValues[locale.languageCode]!['home'];
  }

  String? get other {
    return _localizedValues[locale.languageCode]!['other'];
  }

  String? get office {
    return _localizedValues[locale.languageCode]!['office'];
  }

  String? get bookSpot {
    return _localizedValues[locale.languageCode]!['bookSpot'];
  }

  String? get spots {
    return _localizedValues[locale.languageCode]!['spots'];
  }

  String? get workingHours {
    return _localizedValues[locale.languageCode]!['workingHours'];
  }

  String? get openNow {
    return _localizedValues[locale.languageCode]!['openNow'];
  }

  String? get info {
    return _localizedValues[locale.languageCode]!['info'];
  }

  String? get facilities {
    return _localizedValues[locale.languageCode]!['facilities'];
  }

  String? get coveredRoof {
    return _localizedValues[locale.languageCode]!['coveredRoof'];
  }

  String? get camera {
    return _localizedValues[locale.languageCode]!['camera'];
  }

  String? get overnight {
    return _localizedValues[locale.languageCode]!['overnight'];
  }

  String? get charging {
    return _localizedValues[locale.languageCode]!['charging'];
  }

  String? get disabledParking {
    return _localizedValues[locale.languageCode]!['disabledParking'];
  }

  String? get selectVehicle {
    return _localizedValues[locale.languageCode]!['selectVehicle'];
  }

  String? get change {
    return _localizedValues[locale.languageCode]!['change'];
  }

  String? get selectHours {
    return _localizedValues[locale.languageCode]!['selectHours'];
  }

  String? get min {
    return _localizedValues[locale.languageCode]!['min'];
  }

  String? get hours {
    return _localizedValues[locale.languageCode]!['hours'];
  }

  String? get paymentMode {
    return _localizedValues[locale.languageCode]!['paymentMode'];
  }

  String? get wallet {
    return _localizedValues[locale.languageCode]!['wallet'];
  }

  String? get payOnSpot {
    return _localizedValues[locale.languageCode]!['payOnSpot'];
  }

  String? get creditCard {
    return _localizedValues[locale.languageCode]!['creditCard'];
  }

  String? get paypal {
    return _localizedValues[locale.languageCode]!['paypal'];
  }

  String? get pay {
    return _localizedValues[locale.languageCode]!['pay'];
  }

  String? get close {
    return _localizedValues[locale.languageCode]!['close'];
  }

  String? get yayBooked {
    return _localizedValues[locale.languageCode]!['yayBooked'];
  }

  String? get youveBooked {
    return _localizedValues[locale.languageCode]!['youveBooked'];
  }

  String? get parkingId {
    return _localizedValues[locale.languageCode]!['parkingId'];
  }

  String? get vehicle {
    return _localizedValues[locale.languageCode]!['vehicle'];
  }

  String? get payment {
    return _localizedValues[locale.languageCode]!['payment'];
  }

  String? get parkingSpot {
    return _localizedValues[locale.languageCode]!['parkingSpot'];
  }

  String? get enterAfter {
    return _localizedValues[locale.languageCode]!['enterAfter'];
  }

  String? get exitBefore {
    return _localizedValues[locale.languageCode]!['exitBefore'];
  }

  String? get getDirection {
    return _localizedValues[locale.languageCode]!['getDirection'];
  }

  String? get myBookings {
    return _localizedValues[locale.languageCode]!['myBookings'];
  }

  String? get parkingTimeEnds {
    return _localizedValues[locale.languageCode]!['parkingTimeEnds'];
  }

  String? get addTime {
    return _localizedValues[locale.languageCode]!['addTime'];
  }

  String? get repark {
    return _localizedValues[locale.languageCode]!['repark'];
  }

  String? get parkedOn {
    return _localizedValues[locale.languageCode]!['parkedOn'];
  }

  String? get quickPayments {
    return _localizedValues[locale.languageCode]!['quickPayments'];
  }

  String? get myVehicle {
    return _localizedValues[locale.languageCode]!['myVehicle'];
  }

  String? get manageAddress {
    return _localizedValues[locale.languageCode]!['manageAddress'];
  }

  String? get privacyPolicy {
    return _localizedValues[locale.languageCode]!['privacyPolicy'];
  }

  String? get faq {
    return _localizedValues[locale.languageCode]!['faq'];
  }

  String? get language {
    return _localizedValues[locale.languageCode]!['language'];
  }

  String? get preferredLanguage {
    return _localizedValues[locale.languageCode]!['preferredLanguage'];
  }

  String? get addVehicleinfo {
    return _localizedValues[locale.languageCode]!['addVehicleinfo'];
  }

  String? get presavedAddress {
    return _localizedValues[locale.languageCode]!['presavedAddress'];
  }

  String? get connectUsFor {
    return _localizedValues[locale.languageCode]!['connectUsFor'];
  }

  String? get knowPrivacy {
    return _localizedValues[locale.languageCode]!['knowPrivacy'];
  }

  String? get setYourlanguage {
    return _localizedValues[locale.languageCode]!['setYourlanguage'];
  }

  String? get getYouranswers {
    return _localizedValues[locale.languageCode]!['getYouranswers'];
  }

  String? get myProfile {
    return _localizedValues[locale.languageCode]!['myProfile'];
  }

  String? get everythingAboutyou {
    return _localizedValues[locale.languageCode]!['everythingAboutyou'];
  }

  String? get writeyourMessage {
    return _localizedValues[locale.languageCode]!['writeyourMessage'];
  }

  String? get availableBalance {
    return _localizedValues[locale.languageCode]!['availableBalance'];
  }

  String? get addMoney {
    return _localizedValues[locale.languageCode]!['addMoney'];
  }

  String? get sendToBank {
    return _localizedValues[locale.languageCode]!['sendToBank'];
  }

  String? get paidForParking {
    return _localizedValues[locale.languageCode]!['paidForParking'];
  }

  String? get addedToWallet {
    return _localizedValues[locale.languageCode]!['addedToWallet'];
  }

  String? get receivedFrom {
    return _localizedValues[locale.languageCode]!['receivedFrom'];
  }

  String? get vehiclesYouOwn {
    return _localizedValues[locale.languageCode]!['vehiclesYouOwn'];
  }

  String? get addNewWehicle {
    return _localizedValues[locale.languageCode]!['addNewWehicle'];
  }

  String? get addVehicle {
    return _localizedValues[locale.languageCode]!['addVehicle'];
  }

  String? get vehicleType {
    return _localizedValues[locale.languageCode]!['vehicleType'];
  }

  String? get vehicleName {
    return _localizedValues[locale.languageCode]!['vehicleName'];
  }

  String? get vehicleReg {
    return _localizedValues[locale.languageCode]!['vehicleReg'];
  }

  String? get addLandmark {
    return _localizedValues[locale.languageCode]!['addLandmark'];
  }

  String? get writeAddressLandmark {
    return _localizedValues[locale.languageCode]!['writeAddressLandmark'];
  }

  String? get connectUs {
    return _localizedValues[locale.languageCode]!['connectUs'];
  }

  String? get writeUs {
    return _localizedValues[locale.languageCode]!['writeUs'];
  }

  String? get email {
    return _localizedValues[locale.languageCode]!['email'];
  }

  String? get submit {
    return _localizedValues[locale.languageCode]!['submit'];
  }

  String? get saveAddress {
    return _localizedValues[locale.languageCode]!['saveAddress'];
  }

  String? get addYourIssue {
    return _localizedValues[locale.languageCode]!['addYourIssue'];
  }

  String? get addContactInfo {
    return _localizedValues[locale.languageCode]!['addContactInfo'];
  }

  String? get termsOfUse {
    return _localizedValues[locale.languageCode]!['termsOfUse'];
  }

  String? get howWeWork {
    return _localizedValues[locale.languageCode]!['howWeWork'];
  }

  String? get selectPreferredLanguage {
    return _localizedValues[locale.languageCode]!['selectPreferredLanguage'];
  }

  String? get registerNow {
    return _localizedValues[locale.languageCode]!['registerNow'];
  }

  String? get register {
    return _localizedValues[locale.languageCode]!['register'];
  }

  String? get enterName {
    return _localizedValues[locale.languageCode]!['enterName'];
  }

  String? get enterCode {
    return _localizedValues[locale.languageCode]!['enterCode'];
  }

  String? get setLocation {
    return _localizedValues[locale.languageCode]!['setLocation'];
  }

  String? get viewProfile {
    return _localizedValues[locale.languageCode]!['viewProfile'];
  }

  String? get savedAddresses {
    return _localizedValues[locale.languageCode]!['savedAddresses'];
  }

  String? get addNewLocation {
    return _localizedValues[locale.languageCode]!['addNewLocation'];
  }

  String? get selectAddressType {
    return _localizedValues[locale.languageCode]!['selectAddressType'];
  }

  String? get enterAddressDetails {
    return _localizedValues[locale.languageCode]!['enterAddressDetails'];
  }

  String? get selectPaymentMethod {
    return _localizedValues[locale.languageCode]!['selectPaymentMethod'];
  }

  String? get callUs {
    return _localizedValues[locale.languageCode]!['callUs'];
  }

  String? get mailUs {
    return _localizedValues[locale.languageCode]!['mailUs'];
  }

  String? get about {
    return _localizedValues[locale.languageCode]!['about'];
  }

  String? get address {
    return _localizedValues[locale.languageCode]!['address'];
  }

  String? get location {
    return _localizedValues[locale.languageCode]!['location'];
  }

  String? get days {
    return _localizedValues[locale.languageCode]!['days'];
  }

  String? get done {
    return _localizedValues[locale.languageCode]!['done'];
  }

  String? get time {
    return _localizedValues[locale.languageCode]!['time'];
  }

  String? get addNewAddress {
    return _localizedValues[locale.languageCode]!['addNewAddress'];
  }

  String? get to {
    return _localizedValues[locale.languageCode]!['to'];
  }

  String? get quickPayment {
    return _localizedValues[locale.languageCode]!['quickPayment'];
  }

  String? get contactUs {
    return _localizedValues[locale.languageCode]!['contactUs'];
  }

  String? get save {
    return _localizedValues[locale.languageCode]!['save'];
  }

  String? get myAddresses {
    return _localizedValues[locale.languageCode]!['myAddresses'];
  }

  String? get changeLanguage {
    return _localizedValues[locale.languageCode]!['changeLanguage'];
  }

  String? get selectLanguage {
    return _localizedValues[locale.languageCode]!['selectLanguage'];
  }

  String? get contactNumber {
    return _localizedValues[locale.languageCode]!['contactNumber'];
  }

  String? get writeYourNumber {
    return _localizedValues[locale.languageCode]!['writeYourNumber'];
  }

  String? get howToBookAParking {
    return _localizedValues[locale.languageCode]!['howToBookAParking'];
  }

  String? get howToAddMoneyInWallet {
    return _localizedValues[locale.languageCode]!['howToAddMoneyInWallet'];
  }

  String? get howToChangeLanguage {
    return _localizedValues[locale.languageCode]!['howToChangeLanguage'];
  }

  String? get howToLogoutMyAccount {
    return _localizedValues[locale.languageCode]!['howToLogoutMyAccount'];
  }

  String? get englishh {
    return _localizedValues[locale.languageCode]!['english'];
  }

  String? get arabicc {
    return _localizedValues[locale.languageCode]!['arabic'];
  }

  String? get frenchh {
    return _localizedValues[locale.languageCode]!['french'];
  }

  String? get portuguesee {
    return _localizedValues[locale.languageCode]!['portuguese'];
  }

  String? get sun {
    return _localizedValues[locale.languageCode]!['sun'];
  }

  String? get mon {
    return _localizedValues[locale.languageCode]!['mon'];
  }

  String? get tue {
    return _localizedValues[locale.languageCode]!['tue'];
  }

  String? get wed {
    return _localizedValues[locale.languageCode]!['wed'];
  }

  String? get thr {
    return _localizedValues[locale.languageCode]!['thr'];
  }

  String? get fri {
    return _localizedValues[locale.languageCode]!['fri'];
  }

  String? get sat {
    return _localizedValues[locale.languageCode]!['sat'];
  }

  String? get lorem {
    return _localizedValues[locale.languageCode]!['lorem'];
  }

  String? get indonesiann {
    return _localizedValues[locale.languageCode]!['indonesian'];
  }

  String? get italiann {
    return _localizedValues[locale.languageCode]!['italian'];
  }

  String? get spanishh {
    return _localizedValues[locale.languageCode]!['spanish'];
  }

  String? get swahilii {
    return _localizedValues[locale.languageCode]!['swahili'];
  }

  String? get turkishh {
    return _localizedValues[locale.languageCode]!['turkish'];
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => [
        'en',
        'ar',
        'id',
        'pt',
        'fr',
        'es',
        'tr',
        'it',
        'sw',
      ].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of AppLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}
