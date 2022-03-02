import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:parkapp/Assets/assets.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Routes/routes.dart';
import 'package:parkapp/Theme/colors.dart';

class MoreItems {
  final String image;
  final String? title;
  final String? subtitle;

  MoreItems(this.image, this.title, this.subtitle);
}

class More extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    var theme = Theme.of(context);
    List<MoreItems> _moreItems = [
      MoreItems(Assets.vehicle, locale.myVehicle, locale.addVehicleinfo),
      MoreItems(Assets.address, locale.myAddresses, locale.presavedAddress),
      MoreItems(Assets.support, locale.support, locale.connectUsFor),
      MoreItems(Assets.privacy, locale.privacyPolicy, locale.knowPrivacy),
      MoreItems(Assets.language, locale.changeLanguage, locale.setYourlanguage),
      MoreItems(Assets.faqs, locale.faq, locale.getYouranswers),
    ];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 50,
        title: Padding(
          padding: const EdgeInsets.only(top: 30, left: 5),
          child: Text(
            locale.account! + '\n',
            style: theme.textTheme.subtitle1!.copyWith(fontSize: 17),
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.myProfile);
                    },
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Samantha Smith',
                                textAlign: TextAlign.center,
                                style: theme.textTheme.headline5),
                            Text(
                              locale.myProfile!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.11,
                                fontWeight: FontWeight.w500,
                                color: iconColor,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(50),
                          child: FadedScaleAnimation(
                            Image.asset(
                              'assets/profiles/img1.png',
                              scale: 2,
                            ),
                            durationInMilliseconds: 800,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, PageRoutes.wallet);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  ListTile(
                    horizontalTitleGap: 0,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 22, vertical: 17),
                    leading: FadedScaleAnimation(
                      Icon(
                        Icons.account_balance_wallet_outlined,
                        color: theme.backgroundColor,
                        size: 23,
                      ),
                      durationInMilliseconds: 800,
                    ),
                    title: Text(
                      locale.wallet!,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        locale.quickPayments!,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$159.50    ',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 12, bottom: 10),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _moreItems.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ListTile(
                          horizontalTitleGap: 0,
                          // dense: true,
                          onTap: index == 0
                              ? () {
                                  Navigator.pushNamed(
                                      context, PageRoutes.myVehicles);
                                }
                              : index == 1
                                  ? () {
                                      Navigator.pushNamed(
                                          context, PageRoutes.manageAddress);
                                    }
                                  : index == 2
                                      ? () {
                                          Navigator.pushNamed(
                                              context, PageRoutes.support);
                                        }
                                      : index == 3
                                          ? () {
                                              Navigator.pushNamed(context,
                                                  PageRoutes.privacyPolicy);
                                            }
                                          : index == 4
                                              ? () {
                                                  Navigator.pushNamed(context,
                                                      PageRoutes.language);
                                                }
                                              : () {
                                                  Navigator.pushNamed(
                                                      context, PageRoutes.faqs);
                                                },
                          contentPadding: EdgeInsets.symmetric(horizontal: 24),
                          leading: FadedScaleAnimation(
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Image.asset(
                                _moreItems[index].image,
                                scale: 3,
                              ),
                            ),
                            durationInMilliseconds: 800,
                          ),
                          title: Text(
                            _moreItems[index].title!,
                            style: theme.textTheme.subtitle2,
                          ),
                          subtitle: Text(
                            _moreItems[index].subtitle!,
                            style: theme.textTheme.caption!
                                .copyWith(color: Theme.of(context).hintColor),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
