import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parkapp/Auth/login_navigator.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';

import '../../language_cubit.dart';

class Language extends StatefulWidget {
  final bool isStart;

  Language([this.isStart = false]);
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  late LanguageCubit _languageCubit;

  int? _selectedLanguage = -1;

  void initState() {
    super.initState();
    _languageCubit = BlocProvider.of<LanguageCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;
    List languages = [
      "English",
      "عربى",
      "Français",
      "português",
      "bahasa Indonesia",
      "español",
      "italiano",
      "Kiswahili",
      "Türk"
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
            padding: EdgeInsets.symmetric(horizontal: 8),
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
                      locale.language!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 22),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      locale.preferredLanguage! + '\n',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 15, color: iconColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                Spacer(),
                FadedScaleAnimation(
                  Container(
                    height: 88,
                    child: Image.asset("assets/head_support.png"),
                  ),
                  durationInMilliseconds: 600,
                )
              ],
            ),
          ),
          PositionedDirectional(
            top: 100,
            start: 0,
            end: 0,
            child: FadedSlideAnimation(
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.7,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: ListView(
                  children: [
                    Text(
                      locale.selectPreferredLanguage!,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 14),
                    ),
                    ListView.builder(
                      padding: EdgeInsets.only(bottom: 50),
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 2),
                          padding: EdgeInsets.zero,
                          child: RadioListTile(
                            contentPadding: EdgeInsets.zero,
                            dense: true,
                            activeColor: Theme.of(context).primaryColor,
                            title: Text(languages[index],
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(fontSize: 16)),
                            value: index,
                            groupValue: _selectedLanguage,
                            onChanged: (dynamic val) {
                              setState(() {
                                _selectedLanguage = val;
                                print(val);
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              beginOffset: Offset(0, 0.4),
              endOffset: Offset(0, 0),
              slideCurve: Curves.linearToEaseOut,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: GestureDetector(
              onTap: () {
                if (_selectedLanguage == 0) {
                  _languageCubit.selectEngLanguage();
                } else if (_selectedLanguage == 1) {
                  _languageCubit.selectArabicLanguage();
                } else if (_selectedLanguage == 2) {
                  _languageCubit.selectFrenchLanguage();
                } else if (_selectedLanguage == 3) {
                  _languageCubit.selectPortugueseLanguage();
                } else if (_selectedLanguage == 4) {
                  _languageCubit.selectIndonesianLanguage();
                } else if (_selectedLanguage == 5) {
                  _languageCubit.selectSpanishLanguage();
                } else if (_selectedLanguage == 6) {
                  _languageCubit.selectItalianLanguage();
                } else if (_selectedLanguage == 7) {
                  _languageCubit.selectSwahiliLanguage();
                } else if (_selectedLanguage == 8) {
                  _languageCubit.selectTurkishLanguage();
                }
                if (widget.isStart) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginNavigator()));
                } else {
                  Navigator.pop(context);
                }
              },
              child: FadedScaleAnimation(
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                      height: 55,
                      child: FadedScaleAnimation(
                        ColorButton(locale.submit),
                        durationInMilliseconds: 600,
                      )),
                ),
                durationInMilliseconds: 600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
