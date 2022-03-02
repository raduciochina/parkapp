import 'package:flutter/material.dart';
import 'package:parkapp/Locale/locales.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.onTap,
  }) : super(key: key);
  final String? text;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // ignore: deprecated_member_use
      child: FlatButton(
        padding: EdgeInsets.symmetric(vertical: 16),
        color: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onPressed: onTap as void Function()?,
        child: Text(
          text == null
              ? AppLocalizations.of(context)!.continuee!.toUpperCase()
              : text!.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
      ),
    );
  }
}
