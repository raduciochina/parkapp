import 'dart:io';

import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Components/entry_field.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';
import 'registration_interactor.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;

  RegistrationUI(
    this.registrationInteractor,
  );

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );

  BannerAd? _anchoredBanner;
  bool _loadingAnchoredBanner = false;

  Future<void> _createAnchoredBanner(BuildContext context) async {
    final AnchoredAdaptiveBannerAdSize? size =
    await AdSize.getAnchoredAdaptiveBannerAdSize(
      Orientation.portrait,
      MediaQuery.of(context).size.width.truncate(),
    );

    if (size == null) {
      print('Unable to get height of anchored banner.');
      return;
    }

    final BannerAd banner = BannerAd(
      size: size,
      request: request,
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',
      listener: BannerAdListener(
        onAdLoaded: (Ad ad) {
          print('$BannerAd loaded.');
          setState(() {
            _anchoredBanner = ad as BannerAd?;
          });
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error) {
          print('$BannerAd failedToLoad: $error');
          ad.dispose();
        },
        onAdOpened: (Ad ad) => print('$BannerAd onAdOpened.'),
        onAdClosed: (Ad ad) => print('$BannerAd onAdClosed.'),
      ),
    );
    return banner.load();
  }


  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _anchoredBanner?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
      ),
      body: Builder(builder: (BuildContext){
        if (!_loadingAnchoredBanner) {
          _loadingAnchoredBanner = true;
          _createAnchoredBanner(context);
        }
        return SafeArea(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                color: backgroundColor,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          locale.register!,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 20),
                        ),
                        Text(
                          locale.inLessThanAmin!,
                          style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontSize: 14, color: Theme.of(context).hintColor),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Expanded(
                      child: FadedScaleAnimation(
                        Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            Container(
                              child: Image.asset("assets/img_signin.png"),
                            ),
                          ],
                        ),
                        durationInMilliseconds: 600,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    EntryField(
                      label: locale.fullName,
                      hint: locale.enterFullName,
                    ),
                    EntryField(
                      label: locale.emailAddress,
                      hint: locale.enterEmailAddress,
                    ),
                    EntryField(
                      label: locale.phoneNumber,
                      hint: locale.enterMobileNumber,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(locale.wellSendCode!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14, color: Theme.of(context).hintColor)),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => Verification()));
                        widget.registrationInteractor
                            .register('phoneNumber', 'name', 'email');
                      },
                      child: FadedScaleAnimation(
                        Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: ColorButton(locale.continuee),
                        ),
                        durationInMilliseconds: 600,
                      ),
                    ),
                    SizedBox(height: 150,),
                  ],
                ),
              ),
              if (_anchoredBanner != null)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: _anchoredBanner!.size.width.toDouble(),
                    height: _anchoredBanner!.size.height.toDouble(),
                    child: AdWidget(ad: _anchoredBanner!),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
