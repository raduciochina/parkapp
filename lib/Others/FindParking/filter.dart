import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:parkapp/Assets/assets.dart';
import 'package:parkapp/Components/colorButton.dart';
import 'package:parkapp/Locale/locales.dart';
import 'package:parkapp/Theme/colors.dart';

class SelectPayment {
  String? title;
  String img;
  SelectPayment(this.title, this.img);
}

class Filter extends StatefulWidget {
  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  RangeValues rangeValues = RangeValues(0, 15);
  int timeIndex = 0;
  double sliderValue = 0;

  int paymentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context)!;

    List<SelectPayment> payments = [
      SelectPayment(locale.wallet, Assets.wallet),
      SelectPayment(locale.payOnSpot, Assets.money),
      SelectPayment(locale.creditCard, Assets.debitCard),
      SelectPayment(locale.paypal, Assets.paypal),
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'RESET',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15,
                      letterSpacing: 2.5,
                      color: primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
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
                      'Filter',
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
                        'Search with filtration',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontSize: 16,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ],
            ),
          ),
          FadedSlideAnimation(
            Container(
              padding: EdgeInsets.only(left: 20, top: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.72,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Stack(
                children: [
                  ListView(
                    padding: EdgeInsets.only(bottom: 60),
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),

                      RangeSlider(
                          divisions: 15,
                          labels: RangeLabels(
                              "\$${rangeValues.start.toString()}",
                              "\$${rangeValues.end.toString()}"),
                          activeColor: primaryColor,
                          min: 0,
                          max: 45,
                          values: rangeValues,
                          onChanged: (value) {
                            setState(() {
                              rangeValues = value;
                            });
                          }),
                      // Column(
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Text(
                      //           "\$0",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodyText1
                      //               .copyWith(
                      //                   fontSize: 14,
                      //                   color: primaryColor,
                      //                   fontWeight: FontWeight.w600),
                      //         ),
                      //         Spacer(),
                      //         Text(
                      //           "\$15",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodyText1
                      //               .copyWith(
                      //                   fontSize: 14,
                      //                   color: primaryColor,
                      //                   fontWeight: FontWeight.w600),
                      //         ),
                      //         Spacer()
                      //       ],
                      //     ),
                      //     SizedBox(
                      //       height: 7,
                      //     ),
                      //     Row(
                      //       children: [
                      //         Container(
                      //           padding: EdgeInsets.all(5),
                      //           decoration: BoxDecoration(
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     blurRadius: 0.5,
                      //                     color: Colors.grey,
                      //                     spreadRadius: .5)
                      //               ],
                      //               color: primaryColor,
                      //               border: Border.all(
                      //                   color: Colors.white, width: 2),
                      //               borderRadius: BorderRadius.circular(20)),
                      //         ),
                      //         Expanded(
                      //           child: Divider(
                      //             color: Colors.grey,
                      //           ),
                      //         ),
                      //         Container(
                      //           padding: EdgeInsets.all(5),
                      //           decoration: BoxDecoration(
                      //               boxShadow: [
                      //                 BoxShadow(
                      //                     blurRadius: 0.5,
                      //                     color: Colors.grey,
                      //                     spreadRadius: .5)
                      //               ],
                      //               color: primaryColor,
                      //               border: Border.all(
                      //                   color: Colors.white, width: 2),
                      //               borderRadius: BorderRadius.circular(20)),
                      //         ),
                      //         Expanded(
                      //           child: Divider(
                      //             color: Colors.grey,
                      //           ),
                      //         ),
                      //       ],
                      //     )
                      //   ],
                      // ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        locale.facilities!,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                            ),
                      ),
                      Wrap(
                        children: [
                          TextBox(locale.coveredRoof),
                          TextBox(locale.camera),
                          TextBox(locale.overnight),
                          TextBox(locale.charging),
                          TextBox(locale.disabledParking),
                          TextBox(locale.coveredRoof),
                          TextBox(locale.camera),
                          TextBox(locale.overnight),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Payment Accepted",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 13,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        itemCount: 4,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 75, crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                paymentIndex = index;
                              });
                            },
                            child: FadedScaleAnimation(
                              Container(
                                width: 120,
                                margin: EdgeInsetsDirectional.only(
                                    end: 10, top: 5, bottom: 5),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: paymentIndex == index
                                        ? primaryColor
                                        : cardbg),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      payments[index].img,
                                      scale: 3,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                      child: Text(payments[index].title!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1!
                                              .copyWith(
                                                  fontSize: 13,
                                                  color: paymentIndex == index
                                                      ? Colors.white
                                                      : Colors.black)),
                                    )
                                  ],
                                ),
                              ),
                              durationInMilliseconds: 500,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  PositionedDirectional(
                    bottom: 20,
                    start: 20,
                    end: 20,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: FadedScaleAnimation(
                          Container(
                              height: 55,
                              child: ColorButton(
                                'APPLY',
                              )),
                          durationInMilliseconds: 500,
                        )),
                  ),
                ],
              ),
            ),
            beginOffset: Offset(0, 0.4),
            endOffset: Offset(0, 0),
            slideCurve: Curves.linearToEaseOut,
          )
        ],
      ),
    );
  }
}

class TextBox extends StatefulWidget {
  final String? title;
  TextBox(this.title);

  @override
  _TextBoxState createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 7, top: 10),
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 5),
        decoration: BoxDecoration(
            color: isSelected ? primaryColor : cardbg,
            borderRadius: BorderRadius.circular(20)),
        child: Text(
          widget.title!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 13, color: isSelected ? Colors.white : Colors.black),
        ),
      ),
    );
  }
}
